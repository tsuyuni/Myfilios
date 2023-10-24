//
//  Models.swift
//  Myfilios
//
//  Created by Yuri Tsuchikawa on 2023/10/24.
//

import Foundation
import RealmSwift

class Store: Object {
    @Persisted var name: String!
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}

class Station: Object {
    @Persisted(primaryKey: true) var id: String = NSUUID().uuidString
    @Persisted var name: String!
    @Persisted var stores = List<Store>()
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
    
    func addStore(name: String) {
        let store = Store(name: name)
        stores.append(store)
    }
}

class Route: Object {
    @Persisted(primaryKey: true) var id: Int = 1
    @Persisted var name = ""
    @Persisted var stations = List<Station>()
    
    func addStation(name: String) {
        let station = Station(name: name)
        stations.append(station)
    }
}
