//
//  Models.swift
//  Myfilios
//
//  Created by Yuri Tsuchikawa on 2023/10/24.
//

import Foundation
import RealmSwift

class Store: Object {
    @Persisted(primaryKey: true) var id: ObjectId!
    @Persisted var name: String!
}
