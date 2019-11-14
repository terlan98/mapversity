//
//  ShadowedRoundedUIViewExtension.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 11/14/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    ///Applies shadow and rounded corner effect to the UIView.
    func applyShadowAndRounding(shadowRadius: CGFloat, shadowOffset: CGSize, shadowOpacity: Float, cornerRadius: CGFloat) {
        layer.masksToBounds = false
        
        layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        
        layer.cornerRadius = cornerRadius
    }
}
