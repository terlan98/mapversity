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
    
    private var locations = ["Lobby A","A101","A102","A103","A104","A105","A201","A202","A203"]
    
    private var universities = ["ADA University", "Azerbaijan State Oil and Industry University", "Azerbaijan State University of Economics", "Baku Engineering University", "Baku Higher Oil School"]//For debugging only
    
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
}

