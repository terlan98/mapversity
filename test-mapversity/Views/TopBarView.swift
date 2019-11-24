//
//  LocationSelectionView.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 11/8/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

class TopBarView: UIView {

    override func awakeFromNib() {
        customize()
    }
        
    func customize() {
        applyShadowAndRounding(shadowRadius: 0, shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 0.05, cornerRadius: 0)
    }
}
