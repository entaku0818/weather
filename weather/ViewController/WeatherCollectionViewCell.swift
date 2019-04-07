
//
//  WeatherCollectionViewCell.swift
//  weather
//
//  Created by 遠藤拓弥 on 2019/03/17.
//  Copyright © 2019 遠藤拓弥. All rights reserved.
//

import Foundation
import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!{
        didSet{
            imageView.contentMode = .scaleAspectFit
            imageView.layer.cornerRadius = 6.0
            imageView.clipsToBounds = true
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!

    var forecast: Forecasts? {
        didSet {
            guard let forecast:Forecasts = forecast else { return }
            imageView.image = forecast.image.image
            titleLabel.text = "\(forecast.telop)"
            maxTemperatureLabel.text = forecast.temperature.max?.celsius
            minTemperatureLabel.text = forecast.temperature.min?.celsius
        }
    }
    

}
