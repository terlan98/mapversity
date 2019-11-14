//
//  LocationTextField.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 11/10/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

class LocationTextField: UITextField {

    override func awakeFromNib() {
        customize()
    }

    func customize()
    {
        applyShadowAndRounding(shadowRadius: 2, shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 0.3, cornerRadius: 10)
        
        //To apply padding to the left
        let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 13, height: frame.height))
        leftView = paddingView
        leftViewMode = UITextField.ViewMode.always
        
        textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
