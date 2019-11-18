//
//  EventsManager.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 11/18/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import Foundation
import UIKit

class EventsManager {
    
    static let instance = EventsManager()
    
    private var events = [
    Event(name: "Intro to Software Engineering Class", time: "13:15", location: "A201", note: ""),
    Event(name: "Career Development Class", time: "10:00", location: "A201", note: ""),
    Event(name: "IT Project Management Class", time: "10:00", location: "A201", note: ""),
    ]
    
    func createEvent(name: String, time: String, location: String, note: String = "") {
        events.append(Event(name: name, time: time, location: location, note: note))
    }
    
    func removeEvent(at index: Int) {
        events.remove(at: index)
    }
    
    func getEvents() -> [Event] {
        return events
    }
}
