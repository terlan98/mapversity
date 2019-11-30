//
//  Map.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 11/30/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import Foundation
import UIKit

class Map {
    private(set) public var mapImage: UIImage
    private(set) public var connectables: [Connectable]
    
    init(mapImage: UIImage, connectables: [Connectable]) {
        self.mapImage = mapImage
        self.connectables = connectables
    }
    
    ///Updates itself with a new map image and connectables
    func update(mapImage: UIImage, connectables: [Connectable]) {
        self.mapImage = mapImage
        self.connectables = connectables
    }
}
