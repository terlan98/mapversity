//
//  DataService.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 11/14/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import Foundation
import UIKit

///This class is meant to be handling database related tasks. For now, we do not have a database and therefore this class is full of some dummy data.
class DataBaseHandler {
    
    static let instance = DataBaseHandler()
    
    private var locations = ["A201","A202","A209","A210","Seminar Rooms","Locker Room", "WC", "Stairs", "Elevator"]//For prototype only
    
    private var universities = ["ADA University", "Khazar University", "Oxford University", "Nakhchivan University"]//For prototype only
    
    private var map = Map(mapImage: #imageLiteral(resourceName: "mapImage"), connectables:[
        Location(name: "A201", connected: [], coordinate: (11.3599, -176.680505)),
        Location(name: "Road1", connected: [], coordinate: (11.3604, -176.680505)),
        Location(name: "Road2", connected: [], coordinate: (11.3604, -176.678850)),
        Location(name: "Road3", connected: [], coordinate: (11.3609, -176.678850)),
        Location(name: "Elevators", connected: [], coordinate: (11.3609, -176.679100))
    ])
    
    private var colors = [#colorLiteral(red: 0.6784313725, green: 0.8352941176, blue: 0.968627451, alpha: 1), #colorLiteral(red: 0.9921568627, green: 0.4823529412, blue: 0.3294117647, alpha: 1), #colorLiteral(red: 0.262745098, green: 0.9725490196, blue: 0.6196078431, alpha: 1)]
    
    func getUniversities() -> [String] {
        return universities
    }
    
    func getLocations() -> [String] {
        return locations
    }
    
    func getRandomColor() -> UIColor {
        return colors.randomElement()!
    }
    
    func getMap() -> Map {
        return map
    }
}

