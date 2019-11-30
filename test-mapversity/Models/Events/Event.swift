//
//  Event.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 11/14/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import Foundation

class Event: NSObject, NSCoding {
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
    
    func encode(with coder: NSCoder) {
        coder.encode(self.name, forKey: "name");
        coder.encode(self.time, forKey: "time");
        coder.encode(self.location, forKey: "location");
        coder.encode(self.note, forKey: "note");
    }
    
    required init?(coder: NSCoder) {
        self.name = coder.decodeObject(forKey: "name") as! String
        self.time = coder.decodeObject(forKey: "time") as! String
        self.location = coder.decodeObject(forKey: "location") as! String
        self.note = coder.decodeObject(forKey: "note") as! String
    }
}
