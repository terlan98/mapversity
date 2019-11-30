//
//  Connectable.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 11/30/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import Foundation

protocol Connectable {
    var connected: [Connectable] {get}
}
