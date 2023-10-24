//
//  NewStoreViewController.swift
//  Myfilios
//
//  Created by Yuri Tsuchikawa on 2023/10/24.
//

import UIKit
import RealmSwift

class NewStoreViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    
    weak var station: Station!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func save() {
        do {
            let realm = try Realm()
            try realm.write {
                print(station)
                station.addStore(name: nameField.text ?? "")
                print(station)
                realm.add(station, update: .modified)
            }
            print(realm.objects(Station.self))
        } catch {
            print("保存に失敗しました。\n エラー内容：\(error.localizedDescription)")
            self.dismiss(animated: true)
        }
        guard let nav = self.presentingViewController as? UINavigationController, let home = nav.viewControllers.first as? HomeViewController else { return }
        home.tableView.reloadData()
        self.dismiss(animated: true)
    }
}
