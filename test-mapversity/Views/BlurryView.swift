//
//  BlurryView.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 11/14/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

class BlurryView: UIView {

    override func awakeFromNib() {
        customize()
    }
    
    func customize() {
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        
        self.addSubview(blurEffectView)
    }
}
