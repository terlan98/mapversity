//
//  DataService.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 11/14/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    
    static let instance = DataService()
    
    private var universities = ["ADA University", "Azerbaijan State Oil and Industry University", "Azerbaijan State University of Economics", "Baku Engineering University", "Baku Higher Oil School"]//For debugging only
    
    private var events = [
    Event(name: "Intro to Software Engineering Class", time: "13:15", location: "A201", note: ""),
    Event(name: "Career Development Class", time: "10:00", location: "A201", note: ""),
    Event(name: "IT Project Management Class", time: "10:00", location: "A201", note: ""),
    ]
    
    private var colors = [#colorLiteral(red: 0.6784313725, green: 0.8352941176, blue: 0.968627451, alpha: 1), #colorLiteral(red: 0.9921568627, green: 0.4823529412, blue: 0.3294117647, alpha: 1), #colorLiteral(red: 0.262745098, green: 0.9725490196, blue: 0.6196078431, alpha: 1)]
    
    func getUniversities() -> [String] {
        return universities
    }
    
    func getEvents() -> [Event] {
        return events
    }
    
    func getRandomColor() -> UIColor {
        return colors.randomElement()!
    }
}

