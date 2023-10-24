//
//  HomeViewController.swift
//  Myfilios
//
//  Created by Yuri Tsuchikawa on 2023/10/23.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var stations: [Station] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let realm = try Realm()
//            let route = Route()
//            route.addStation(name: "六本木一丁目")
//            route.addStation(name: "溜池山王")
//            route.addStation(name: "永田町")
//            route.addStation(name: "四ツ谷")
//            route.addStation(name: "市ヶ谷")
//            route.addStation(name: "飯田橋")
//            route.addStation(name: "後楽園")
//            route.addStation(name: "東大前")
//            try realm.write {
//                realm.add(route, update: .modified)
//            }
            guard let route = realm.objects(Route.self).first else { return }
            stations = Array(route.stations)
        } catch {
            print("データの読み込みに失敗しました。\n エラー内容：\(error.localizedDescription)")
        }
        
        print(stations)
        tableView.register(UINib(nibName: "Station", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    @IBAction func AddRoute() {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "addRoute"), let nav = self.navigationController else { return }
        nav.pushViewController(nextVC, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! StationTableViewCell
        let station = stations[indexPath.row]
        cell.stationLabel.text = station.name
        cell.station = station
        cell.stores = Array(station.stores)
        cell.storeCollectionView.reloadData()
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}

extension HomeViewController: StationTableViewCellDelegate {
    func onTapAddStoreButton(cell: UITableViewCell, station: Station) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "newStore") as? NewStoreViewController else { return }
        nextVC.station = station
        self.present(nextVC, animated: true)
    }
}
