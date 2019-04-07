//
//  WeatherAreaRepository.swift
//  weather
//
//  Created by 遠藤拓弥 on 2019/03/17.
//  Copyright © 2019 遠藤拓弥. All rights reserved.
//

import Foundation


struct WeatherAreaRepository {


    func getAreaData() -> [WeatherArea] {
        return self.mockData()
    }

    private func mockData() -> [WeatherArea] {

        let data:[WeatherArea] = [
            WeatherArea(id:"130010",name:"東京"),
            WeatherArea(id:"070020",name:"小名浜"),
        ]

        

        return data
    }
}
