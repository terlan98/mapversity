//
//  ChooseUniView.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 11/6/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

class ChooseUniView: UIView {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightSideBtn: UIButton!
    @IBOutlet weak var invisibleBtn: UIButton!
    @IBOutlet weak var rightSideBtnHeightContraint:NSLayoutConstraint!
    
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
    
    ///Performs necessary animations and changes to become active and ready to show what UIPickerView dictates
    func becomeActive()
    {
        layer.cornerRadius = 10
        label.font = label.font.withSize(15)
       
        invisibleBtn.isHidden = true
        
rightSideBtn.setImage(#imageLiteral(resourceName: "greenTick"), for: .normal)
        rightSideBtnHeightContraint.constant = 15
    }
    
    func selectUniversity(name: String)
    {
        label.text = name
    }
}
