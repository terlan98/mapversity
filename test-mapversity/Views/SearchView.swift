//
//  SearchView.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 10/5/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

class SearchView: UIView {

    override func awakeFromNib() {
        
        customize()
    }
    
    func customize() {
        
        layer.masksToBounds = false
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 5
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.3
        
        layer.cornerRadius = 10
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}
