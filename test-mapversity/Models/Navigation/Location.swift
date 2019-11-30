//
//  Location.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 11/30/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import Foundation

class Location: Connectable {
    var name: String
    var connected: [Connectable]
    var coordinate: (Double, Double)
    var type: locationType
    
    init(name: String, connected: [Connectable], coordinate: (Double, Double), type: locationType = .normal) {
        self.name = name
        self.connected = connected
        self.coordinate = coordinate
        self.type = type
    }
}

enum locationType: String {
    case normal
    case course
}
