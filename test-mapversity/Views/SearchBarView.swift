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
        applyShadowAndRounding(shadowRadius: 2, shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 0.2, cornerRadius: 10)
    }
}
