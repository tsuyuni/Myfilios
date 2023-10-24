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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let realm = try Realm()
            let stores = realm.objects(Store.self)
            print(stores)
            
        } catch {
            print("データの読み込みに失敗しました。\n エラー内容：\(error.localizedDescription)")
        }
        
        tableView.register(UINib(nibName: "Station", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    @IBAction func AddRoute() {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "addRoute"), let nav = self.navigationController else { return }
        nav.pushViewController(nextVC, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DummyData.stations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! StationTableViewCell
        cell.stationLabel.text = DummyData.stations[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}

extension HomeViewController: StationTableViewCellDelegate {
    func onTapAddStoreButton(cell: UITableViewCell) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "newStore") else { return }
        self.present(nextVC, animated: true)
    }
}
