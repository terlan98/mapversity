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
    
    ///Saves existing events to UserDefaults
    func save() {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: events, requiringSecureCoding: false)
            UserDefaults.standard.set(data, forKey: "savedEvents")
        } catch {
            print("Couldn't save events to UserDefaults.")
        }
    }
    
    ///Updates the event list from UserDefaults
    func update() {
        guard let decoded = UserDefaults.standard.object(forKey: "savedEvents") as? Data else {
            print("No saved events. Loading dummy data...")
            return
        }
        
        do{
            if let loadedEvents = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decoded) as? [Event] {
            events = loadedEvents
            }
        } catch {
            print("Couldn't load events from UserDefaults.")
        }
    }
    
    ///Creates and saves a new event
    func createEvent(name: String, time: String, location: String, note: String = "") {
        events.append(Event(name: name, time: time, location: location, note: note))
        save()
    }
    
    ///Removes an event and saves the current events
    func removeEvent(at index: Int) {
        events.remove(at: index)
        save()
    }
    
    func getEvents() -> [Event] {
        return events
    }
}
