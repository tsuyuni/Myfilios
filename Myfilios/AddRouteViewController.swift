//
//  AddRouteViewController.swift
//  Myfilios
//
//  Created by Yuri Tsuchikawa on 2023/10/23.
//

import UIKit

class AddRouteViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "RouteTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.register(UINib(nibName: "RouteTableViewCell+AddStation", bundle: nil), forCellReuseIdentifier: "addCell")
    }
}

extension AddRouteViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0: return 3
        case 1: return 1
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let addCell = tableView.dequeueReusableCell(withIdentifier: "addCell")!
        return indexPath.section == 0 ? cell : addCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "addStation") else { return }
            self.present(nextVC, animated: true)
        }
    }
}
