//
//  ViewController.swift
//  TeikikennaiStores
//
//  Created by Yuri Tsuchikawa on 2023/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "StationTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    @IBAction func AddRoute() {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "addRoute"), let nav = self.navigationController else { return }
        nav.pushViewController(nextVC, animated: true)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DummyData.stations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! StationTableViewCell
        cell.stationLabel.text = DummyData.stations[indexPath.row]
        cell.delegate = self
        return cell
    }
}

extension ViewController: StationTableViewCellDelegate {
    func onTapAddStoreButton(cell: UITableViewCell) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "addStore") else { return }
        self.present(nextVC, animated: true)
    }
}
