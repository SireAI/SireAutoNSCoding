//
//  Storable.swift
//  YaApple
//
//  Created by Sire on 16/4/18.
//  Copyright © 2016年 sire. All rights reserved.
//

import Foundation

extension NSFileManager {
	/**
	 file path below document directory

	 - parameter fileName: the name of the file

	 - returns: relative path
	 */
	static func documentDirectoryFile(fileName: String) -> String {
		let documentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
		let archiveURL = documentsDirectory.URLByAppendingPathComponent(fileName)
		return archiveURL.path!
	}
}

protocol Storable: NSCoding {
	func storeToDisk()
}

// - MARK: force turn object to AnyObject?

protocol ValueConverter {
	func toValue() -> AnyObject?
}
extension ValueConverter {
	func toValue() -> AnyObject? {
		return self as? AnyObject
	}
}
extension Optional: ValueConverter {
	func toValue() -> AnyObject? {
		if let x = self {
			if let value = x as? ValueConverter {
				return value.toValue()
			}
		}
		return nil
	}
}
extension String: ValueConverter { }
extension Int: ValueConverter { }
extension Bool: ValueConverter { }
extension Character: ValueConverter { }
extension Dictionary: ValueConverter { }
extension Array: ValueConverter { }
extension Store: ValueConverter { }

public class Store: NSObject, Storable {

	// - MARK: public api

	public static func recoverFromDisk(fileName: String) -> AnyObject? {
		return NSKeyedUnarchiver.unarchiveObjectWithFile(NSFileManager.documentDirectoryFile(fileName))
	}
	public func storeToDisk() {
		archiverObject(self, fileName: "\(self.dynamicType)")
	}

	public override init() {
		super.init()

	}

	// - MARK: Inner API

	private func archiverObject(object: NSCoding, fileName: String) {
		NSKeyedArchiver.archiveRootObject(object, toFile: NSFileManager.documentDirectoryFile(fileName))
	}

	required convenience public init?(coder aDecoder: NSCoder) {
		self.init()

		let mirror = Mirror(reflecting: self)
		var propertyLabels = [String]()
		for property in mirror.children {
			propertyLabels += [property.label!]
		}
		for key in propertyLabels {
			if aDecoder.containsValueForKey(key) {
				let value = aDecoder.decodeObjectForKey(key)
				if let value = value {
					self.setValue(value, forKey: key)
				}
			}
		}
	}

	public func encodeWithCoder(aCoder: NSCoder) {
		let mirror = Mirror(reflecting: self)
		if mirror.children.count > 0 {
			let keyValues = getObjectPropertiesCollection(mirror)
			for (key, value) in keyValues {
				aCoder.encodeObject(value, forKey: key)
			}
		}
	}

	private func getObjectPropertiesCollection(mirror: Mirror) -> [String: AnyObject] {
		var keyvalues = [String: AnyObject]()

		for property in mirror.children {
			if property.value is ValueConverter {
				keyvalues[property.label!] = (property.value as? ValueConverter).toValue()
			}
		}
		return keyvalues
	}
}
