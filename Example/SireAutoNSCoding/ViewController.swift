//
//  ViewController.swift
//  SireAutoNSCoding
//
//  Created by Sire on 05/17/2016.
//  Copyright (c) 2016 Sire. All rights reserved.
//

import UIKit
import SireAutoNSCoding
class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// raw data
		let oldInfor = MallInfor()
		print("oldeInfor:\n \(oldInfor.description)")

		// change some value
		oldInfor.Code = "100000"
		oldInfor.Msg = "what a new day"
		oldInfor.ExceptionMsg = "no error"
		oldInfor.Result = SeckillListEntity()
		oldInfor.Result!.BrandCountryLogo = "world china"

		// save to disk
		oldInfor.storeToDisk()

		// recover data
		let newInfor = MallInfor.recoverFromDisk("\(MallInfor.self)")

		print("newInfor:\n \(newInfor!.description)")
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}

