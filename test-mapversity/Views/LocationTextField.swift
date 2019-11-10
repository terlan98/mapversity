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
        layer.masksToBounds = false
        
        layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowOpacity = 0.3
        
        layer.cornerRadius = 10
        
        //To apply padding
        let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 13, height: frame.height))
        leftView = paddingView
        leftViewMode = UITextField.ViewMode.always
        
        textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
//    override func textRect(forBounds bounds: CGRect) -> CGRect {
//        return bounds
//    }
}
