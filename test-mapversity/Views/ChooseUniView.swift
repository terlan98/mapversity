//
//  ChooseUniView.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 11/6/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

class ChooseUniView: UIView {

    override func awakeFromNib() {
        customize()
    }

    func customize()
    {
        layer.masksToBounds = false
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 0.2
        
        layer.cornerRadius = 10
    }
}
