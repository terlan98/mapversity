//
//  SearchBarView.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 10/5/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

class SearchBarView: UIView {

    override func awakeFromNib() {
        
        customize()
    }
    
    func customize() {
        
        layer.masksToBounds = false
        
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowOpacity = 0.2
        
        layer.cornerRadius = 10
    }
}
