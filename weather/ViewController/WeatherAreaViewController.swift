//
//  WeatherAreaViewController..swift
//  weather
//
//  Created by 遠藤拓弥 on 2019/03/17.
//  Copyright © 2019 遠藤拓弥. All rights reserved.
//

import Foundation
import UIKit

class WeatherAreaViewController: UITableViewController {



    var areas:[WeatherArea] = [] {
        didSet{
            tableView.reloadData()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        let weatherAreaRepository:WeatherAreaRepository = WeatherAreaRepository()

        self.areas = weatherAreaRepository.getAreaData()

    }

    override func loadView() {
        super.loadView()
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib.init(nibName: "WeatherAreaCell", bundle: nil), forCellReuseIdentifier: "WeatherAreaCell")
    }

    override func viewWillAppear(_ animated: Bool){


    }




    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.areas.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: WeatherAreaCell = tableView.dequeueReusableCell(withIdentifier: "WeatherAreaCell", for: indexPath) as! WeatherAreaCell

        cell.areaNameLabel.text = self.areas[indexPath.row].name
        return cell

    }

}
