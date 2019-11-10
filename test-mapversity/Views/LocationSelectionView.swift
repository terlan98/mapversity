//
//  LocationSelectionView.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 11/8/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

class LocationSelectionView: UIView {

    override func awakeFromNib() {
        customize()
    }
        
    func customize() {
           
        layer.masksToBounds = false
        
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowOpacity = 0.15
    }
}
