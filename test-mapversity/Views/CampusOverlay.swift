//
//  CampusOverlay.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 10/5/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit
import MapKit

class CampusOverlay: NSObject, MKOverlay {
    var coordinate: CLLocationCoordinate2D
    var boundingMapRect: MKMapRect

    init(coordinate: CLLocationCoordinate2D, boundingMapRect: MKMapRect) {
        self.boundingMapRect = boundingMapRect
        self.coordinate = coordinate
    }
    
    func canReplaceMapContent() -> Bool {
        return true
    }
}
