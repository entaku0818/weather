//
//  Weather.swift
//  weather
//
//  Created by 遠藤拓弥 on 2019/03/17.
//  Copyright © 2019 遠藤拓弥. All rights reserved.
//

import Foundation
import UIKit

struct Weather:Decodable{
    init(title:String,forecasts:[Forecasts]) {
        self.title = title
        self.forecasts = forecasts
        self.description = Description.init()
    }

    let forecasts:[Forecasts]
    let title:String
    let description:Description
}
struct Forecasts:Decodable {
    init() {
        self.dateLabel = "今日"
        self.telop = "曇時々雨"
        self.temperature = Temperature.init()
        self.image = ForecastImage.init()
    }
    let dateLabel:String
    let telop: String
    let temperature:Temperature
    let image:ForecastImage
}
struct Description:Decodable  {
    init() {
        text = " 高気圧が、東シナ海を東へ移動しています。\n\n 東京地方は、おおむね晴れています。\n\n 24日は、高気圧に覆われるためおおむね晴れますが、気圧の谷の影響で\n夜のはじめ頃は曇りとなるでしょう。\n\n 25日は、高気圧に覆われるため、晴れますが、上空の気圧の谷の影響で\n夕方から曇りとなる見込みです。\n\n【関東甲信地方】\n 関東甲信地方は、おおむね晴れています。\n\n 24日は、高気圧に覆われるため、おおむね晴れるでしょう。\n\n 25日は、高気圧に覆われるため、おおむね晴れますが、午後は上空の気\n圧の谷の影響で次第に曇りとなる見込みです。\n\n 関東地方と伊豆諸島の海上では、24日から25日にかけて、波が高いで\nしょう。船舶は高波に注意してください。"
        publicTime = "2019-03-24T16:35:00+0900"
    }
    let text:String
    let publicTime:String
}

struct ForecastImage:Decodable  {
    init() {
        self.title = "曇時々雨"
    }
    var image:UIImage {
        switch self.title.first {
        case "曇":
            return #imageLiteral(resourceName: "cloud")
        case "晴":
            return #imageLiteral(resourceName: "sunny")
        case "雨":
            return #imageLiteral(resourceName: "sunny")
        default:
            return #imageLiteral(resourceName: "sunny")
        }

    }
    let title:String
}
struct Temperature:Decodable {
    init() {
        self.min = TemperatureDetail.init(celsius: "14")
        self.max = TemperatureDetail.init(celsius: "14")
    }
    let min:TemperatureDetail?
    let max:TemperatureDetail?
}
struct TemperatureDetail:Decodable {
    let celsius:String
}




//{
//    "pinpointLocations": [
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1310100",
//    "name": "千代田区"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1310200",
//    "name": "中央区"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1310300",
//    "name": "港区"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1310400",
//    "name": "新宿区"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1310500",
//    "name": "文京区"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1310600",
//    "name": "台東区"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1310700",
//    "name": "墨田区"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1310800",
//    "name": "江東区"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1310900",
//    "name": "品川区"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1311000",
//    "name": "目黒区"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1311100",
//    "name": "大田区"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1311200",
//    "name": "世田谷区"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1311300",
//    "name": "渋谷区"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1311400",
//    "name": "中野区"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1311500",
//    "name": "杉並区"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1311600",
//    "name": "豊島区"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1311700",
//    "name": "北区"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1311800",
//    "name": "荒川区"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1311900",
//    "name": "板橋区"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1312000",
//    "name": "練馬区"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1312100",
//    "name": "足立区"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1312200",
//    "name": "葛飾区"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1312300",
//    "name": "江戸川区"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1320100",
//    "name": "八王子市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1320200",
//    "name": "立川市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1320300",
//    "name": "武蔵野市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1320400",
//    "name": "三鷹市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1320500",
//    "name": "青梅市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1320600",
//    "name": "府中市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1320700",
//    "name": "昭島市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1320800",
//    "name": "調布市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1320900",
//    "name": "町田市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1321000",
//    "name": "小金井市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1321100",
//    "name": "小平市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1321200",
//    "name": "日野市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1321300",
//    "name": "東村山市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1321400",
//    "name": "国分寺市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1321500",
//    "name": "国立市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1321800",
//    "name": "福生市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1321900",
//    "name": "狛江市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1322000",
//    "name": "東大和市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1322100",
//    "name": "清瀬市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1322200",
//    "name": "東久留米市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1322300",
//    "name": "武蔵村山市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1322400",
//    "name": "多摩市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1322500",
//    "name": "稲城市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1322700",
//    "name": "羽村市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1322800",
//    "name": "あきる野市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1322900",
//    "name": "西東京市"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1330300",
//    "name": "瑞穂町"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1330500",
//    "name": "日の出町"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1330700",
//    "name": "檜原村"
//    },
//    {
//    "link": "http://weather.livedoor.com/area/forecast/1330800",
//    "name": "奥多摩町"
//    }
//    ],
//    "link": "http://weather.livedoor.com/area/forecast/130010",
//    "forecasts": [
//    {
//    "dateLabel": "今日",
//    "telop": "曇時々雨",
//    "date": "2019-03-17",
//    "temperature": {
//    "min": null,
//    "max": {
//    "celsius": "14",
//    "fahrenheit": "57.2"
//    }
//    },
//    "image": {
//    "width": 50,
//    "url": "http://weather.livedoor.com/img/icon/10.gif",
//    "title": "曇時々雨",
//    "height": 31
//    }
//    },
//    {
//    "dateLabel": "明日",
//    "telop": "晴れ",
//    "date": "2019-03-18",
//    "temperature": {
//    "min": {
//    "celsius": "4",
//    "fahrenheit": "39.2"
//    },
//    "max": {
//    "celsius": "14",
//    "fahrenheit": "57.2"
//    }
//    },
//    "image": {
//    "width": 50,
//    "url": "http://weather.livedoor.com/img/icon/1.gif",
//    "title": "晴れ",
//    "height": 31
//    }
//    },
//    {
//    "dateLabel": "明後日",
//    "telop": "曇時々晴",
//    "date": "2019-03-19",
//    "temperature": {
//    "min": null,
//    "max": null
//    },
//    "image": {
//    "width": 50,
//    "url": "http://weather.livedoor.com/img/icon/9.gif",
//    "title": "曇時々晴",
//    "height": 31
//    }
//    }
//    ],
//    "location": {
//        "city": "東京",
//        "area": "関東",
//        "prefecture": "東京都"
//    },
//    "publicTime": "2019-03-17T11:00:00+0900",
//    "copyright": {
//        "provider": [
//        {
//        "link": "http://tenki.jp/",
//        "name": "日本気象協会"
//        }
//        ],
//        "link": "http://weather.livedoor.com/",
//        "title": "(C) LINE Corporation",
//        "image": {
//            "width": 118,
//            "link": "http://weather.livedoor.com/",
//            "url": "http://weather.livedoor.com/img/cmn/livedoor.gif",
//            "title": "livedoor 天気情報",
//            "height": 26
//        }
//    },
//    "title": "東京都 東京 の天気",
//    "description": {
//        "text": " 西日本から東日本は高気圧に覆われています。一方、日本海西部には上空\nに寒気を伴った気圧の谷があって、東南東に進んでいます。\n\n 東京地方は、おおむね晴れています。\n\n 17日は、はじめ高気圧に覆われますが、上空に寒気を伴った気圧の谷が\n通過するため、曇り時々晴れで夕方は雨となるでしょう。また、昼過ぎから\nは雨や雷雨となる所がある見込みです。\n\n 18日は、高気圧に覆われるため晴れますが、気圧の谷の影響により、夜\nは曇りとなるでしょう。\n\n\n【関東甲信地方】\n 関東甲信地方は、おおむね晴れています。\n\n 17日は、はじめ高気圧に覆われておおむね晴れますが、上空に寒気を伴\nった気圧の谷が通過するため次第に曇りとなり、雨や雷雨となる所があるで\nしょう。標高の高い所では、雪の降る所もある見込みです。\n\n 18日は、高気圧に覆われて晴れるでしょう。\n\n 関東地方と伊豆諸島の海上では、17日から18日にかけて波が高く、う\nねりを伴うでしょう。船舶は高波に注意してください。",
//        "publicTime": "2019-03-17T10:44:00+0900"
//    }
//}
