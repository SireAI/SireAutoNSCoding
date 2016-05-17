//
//	MallInfor.swift
import Foundation
import SireAutoNSCoding

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

