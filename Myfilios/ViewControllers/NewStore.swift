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

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func save() {
        let store = Store(name: nameField.text)
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(store)
            }
        } catch {
            print("保存に失敗しました。\n エラー内容：\(error.localizedDescription)")
            self.dismiss(animated: true)
        }
        self.dismiss(animated: true)
    }
}
