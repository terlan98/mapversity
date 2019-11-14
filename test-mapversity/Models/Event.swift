//
//  Event.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 11/14/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import Foundation

class Event {
    private(set) public var name: String
    private(set) public var time: String
    private(set) public var location: String
    private(set) public var note: String
    
    init(name: String, time: String, location: String, note: String) {
        self.name = name
        self.time = time
        self.location = location
        self.note = note
    }
}
