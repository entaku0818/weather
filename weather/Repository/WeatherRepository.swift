//
//  WeatherAreaRepository.swift
//  weather
//
//  Created by 遠藤拓弥 on 2019/03/17.
//  Copyright © 2019 遠藤拓弥. All rights reserved.
//

import Foundation
import APIKit

struct WeatherRepository {


    func getWeatherData() -> Weather {
        return self.mockData()
    }



    private func mockData() -> Weather {

        let data:Weather =
            Weather.init(title: "東京都 東京 の天気", forecasts: [
                Forecasts.init(),
                Forecasts.init(),
                Forecasts.init()
            ]
        )


        return data
    }





}
