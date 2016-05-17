# SireAutoNSCoding

[![CI Status](http://img.shields.io/travis/Sire/SireAutoNSCoding.svg?style=flat)](https://travis-ci.org/Sire/SireAutoNSCoding)
[![Version](https://img.shields.io/cocoapods/v/SireAutoNSCoding.svg?style=flat)](http://cocoapods.org/pods/SireAutoNSCoding)
[![License](https://img.shields.io/cocoapods/l/SireAutoNSCoding.svg?style=flat)](http://cocoapods.org/pods/SireAutoNSCoding)
[![Platform](https://img.shields.io/cocoapods/p/SireAutoNSCoding.svg?style=flat)](http://cocoapods.org/pods/SireAutoNSCoding)

==
If you like SwiftAutoNSCoding and use it, could you please:

star this repo

send me some feedback. Thanks!
##Basic usage

Consider you have a object data like this:
```Swift
import Foundation

class MallInfor: Store {
	var Code: String = "1"
	var ExceptionMsg: String = "对象序列化"
	var Msg: String = "成功"
	var RequestId: String = "33"
	var Result: SeckillListEntity?
	override var description: String {
		return "Code:\(Code)  \n" + "ExceptionMsg:\(ExceptionMsg)  \n" + "Msg:\(Msg)  \n" + "Result.BrandCountryLogo:\(Result?.BrandCountryLogo)  \n"
	}
}

class SeckillListEntity: Store {
	var BrandCountryLogo: String = "中国"
	var BuyNumber: Int = 2
	var CountryName: String? = "中国"
	var DisCount: Int = 3
	var Features: String? = "壮丽"
	var ImageNameFull: String? = "图片名称"
	var InStock: Bool = false
	var ItemCode: String? = "4444"
	var MarketPrice: String?
	var Name: String?
	var PromotionDescription: String?
	var PromotionPrice: String?
	var ShortName: String? = "华夏"
}
````
###save data object to disk
```Swift
		// raw data
		let oldInfor = MallInfor()
		// change some value
		oldInfor.Code = "100000"
		oldInfor.Msg = "what a new day"
		oldInfor.ExceptionMsg = "no error"
		oldInfor.Result = SeckillListEntity()
		oldInfor.Result!.BrandCountryLogo = "world china"

		// save to disk
		oldInfor.storeToDisk()
````
###recover data from disk
```Swift
   let newInfor = MallInfor.recoverFromDisk("\(MallInfor.self)")
````

##Attention
- object must inherit `Store`

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

SireAutoNSCoding is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SireAutoNSCoding", :git => 'https://github.com/SireAI/SwiftAutoNSCoding.git'
```

## Author

Sire, 1120523212@qq.com   
[Sire的博客](http://sireai.github.io/)

##MyOther Projects
[SireJSONModel](https://github.com/SireAI/SireJSONModel)

## License

SireAutoNSCoding is available under the MIT license. See the LICENSE file for more info.
