//
//  WelcomeVC.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 11/6/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var welcomeTitleLabel: UILabel!
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var mapversityLbl: UILabel!
    @IBOutlet weak var chooseUniView: ChooseUniView!
    @IBOutlet weak var chooseUniViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var chooseUniViewTrailingConstraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.isModalInPresentation = true //ensures that user cannot dismiss this VC by swiping down
        
        nextBtn.layer.cornerRadius = 8
        
    }
    
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        hideWelcomeInfo()
        performAnimations()
    }
    
    ///Hides info about using the app (such as "Pick your location").
    func hideWelcomeInfo()
    {
        infoView.isHidden = true
        welcomeTitleLabel.isHidden = true
    }
    
    ///Performs animations that are necessary to switch to the university choosing mode.
    func performAnimations()
    {
        self.chooseUniView.isHidden = false
        self.chooseUniView.layer.opacity = 0

        UIView.animate(withDuration: 0.6) {
            let scale = CGAffineTransform(scaleX: 1.8, y: 1.8)
            let move = CGAffineTransform(translationX: 0, y: 50)
            let moveLabel = CGAffineTransform(translationX: 0, y: 80)
            
            self.logoImg.transform = scale.concatenating(move)
            self.mapversityLbl.transform = moveLabel
            self.chooseUniView.layer.opacity = 100
        }
    }
    
    @IBAction func chooseBtnPressed(_ sender: Any) {
        
        UIView.animate(withDuration: 0.3) {
            self.chooseUniViewLeadingConstraint.constant = 0
            self.chooseUniViewTrailingConstraint.constant = 0
            self.chooseUniView.setNeedsLayout()
            self.chooseUniView.layoutIfNeeded()
        }
        
        self.chooseUniView.becomeActive()
    }
    
}
