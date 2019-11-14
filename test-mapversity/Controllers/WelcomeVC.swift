//
//  WelcomeVC.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 11/6/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var welcomeTitleLabel: UILabel!
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var mapversityLbl: UILabel!
    @IBOutlet weak var chooseUniView: ChooseUniView!
    @IBOutlet weak var chooseUniViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var chooseUniViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var uniPickerView: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uniPickerView.dataSource = self
        uniPickerView.delegate = self
        
        self.isModalInPresentation = true //ensures that user cannot dismiss this VC by swiping down
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
        nextBtn.isHidden = true
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
        uniPickerView.isHidden = false
        uniPickerView.layer.opacity = 0
        
        UIView.animate(withDuration: 0.3) {
            self.chooseUniViewLeadingConstraint.constant = 0
            self.chooseUniViewTrailingConstraint.constant = 0
            self.chooseUniView.setNeedsLayout()
            self.chooseUniView.layoutIfNeeded()
            
            self.uniPickerView.layer.opacity = 100
        }
        
        self.chooseUniView.becomeActive()
    }
    
    ///This is for the case when the user has already tapped on chooseUniView once, selected a university and wants to confirm the seleection
    @IBAction func rightSideBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //----------------------UIPickerView related functions----------------------
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DataService.instance.getUniversities().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return DataService.instance.getUniversities()[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chooseUniView.selectUniversity(name: DataService.instance.getUniversities()[row])
    }
}
