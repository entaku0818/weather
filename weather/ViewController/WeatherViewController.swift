//
//  WeatherViewController.swift
//  weather
//
//  Created by 遠藤拓弥 on 2019/03/17.
//  Copyright © 2019 遠藤拓弥. All rights reserved.
//

import Foundation
import UIKit
import PINRemoteImage
import APIKit

class WeatherViewController: UIViewController {





    @IBOutlet weak var weatherImageView: UIImageView!
    var forecasts:[Forecasts] = [] {
        didSet{
            self.collectionView.reloadData()
        }
    }

    var weather:Weather?{
        didSet{
            self.forecasts = weather?.forecasts ?? []
            self.title = weather?.title
            self.weatherImageView.image = self.weather?.forecasts.first?.image.image
            detailLabel.text = self.weather?.description.text
            detailLabel.adjustsFontSizeToFitWidth = true
        }
    }

    var cityId:String!


    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var detailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()


        Session.send(WeatherRepository.WeatherRequest(cityId: cityId)) { result in
            switch result {
            case .success(let response):
                self.weather = response
            case .failure(let error):
                print(error.localizedDescription)
            }
        }


    }

    override func loadView() {
        super.loadView()
        self.collectionView.register(UINib.init(nibName: "WeatherCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "WeatherCollectionViewCell")
        self.collectionView.dataSource = self
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width:150, height:300)
        layout.sectionInset = UIEdgeInsets(top: 16, left: 0, bottom: 32, right: 16)
        layout.scrollDirection = .horizontal

        self.collectionView.collectionViewLayout = layout

    }


}

extension WeatherViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecasts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: WeatherCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCollectionViewCell", for: indexPath) as! WeatherCollectionViewCell
        cell.forecast = self.forecasts[indexPath.row]
        return cell
    }


}

