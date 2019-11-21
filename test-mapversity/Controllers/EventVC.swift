//
//  EventController.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 11/12/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

class EventVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate,  UIPickerViewDataSource {

    enum Mode: String {
        case add //user tapped the + button and is adding a new event
        case idle //user is just browsing the existing events
    }
    
    @IBOutlet weak var eventTableView: UITableView!
    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var newEventView: UIView!
    @IBOutlet weak var upperRightBtn: UIButton!
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var timeTxtField: UITextField!
    @IBOutlet weak var placeTxtField: UITextField!
    @IBOutlet weak var noteTxtField: UITextField!
    @IBOutlet weak var cancelBtn: UIButton!
    
    let locationPickerView = UIPickerView()
    
    var currentMode: Mode = .idle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        eventTableView.delegate = self
        eventTableView.dataSource = self
        
        customize()
        
        locationPickerView.delegate = self
        locationPickerView.dataSource = self
        placeTxtField.inputView = locationPickerView
        
        EventsManager.instance.update()
    }
    
    func customize() {
        nameTxtField.applyShadowAndRounding(shadowColor: #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1), shadowRadius: 0, shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 1, cornerRadius: 0)
        timeTxtField.applyShadowAndRounding(shadowColor: #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1), shadowRadius: 0, shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 1, cornerRadius: 0)
        placeTxtField.applyShadowAndRounding(shadowColor: #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1), shadowRadius: 0, shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 1, cornerRadius: 0)
        noteTxtField.applyShadowAndRounding(shadowColor: #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1), shadowRadius: 0, shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 1, cornerRadius: 0)
    }
    
    ///Clears all UITextFields used for creating a new event.
    func clearTxtFields() {
        nameTxtField.text = ""
        timeTxtField.text = ""
        placeTxtField.text = ""
        noteTxtField.text = ""
    }
    
    ///Switches the currentMode variable between add and idle modes
    func switchMode()
    {
        currentMode = (currentMode == .idle) ? .add : .idle
    }
    
    func showEmptyTxtFieldError() {
        
        let alert = UIAlertController(title: "Error", message: "Please provide all of the required information about the new event", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

        self.present(alert, animated: true)
    }
    
    ///Makes the required changes to the view for a given mode.
    func updateView (for mode: Mode) {
        if (mode == .add) {
            self.blurView.isHidden = false
            self.blurView.alpha = 0

            self.newEventView.isHidden = false
            self.newEventView.alpha = 0
            
            UIView.animate(withDuration: 0.2, animations: {
                self.blurView.alpha = 1
                self.newEventView.alpha = 1
            }) { (nil) in
                self.upperRightBtn.setTitle("DONE", for: .normal)
                self.upperRightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
                
                self.cancelBtn.isHidden = false
                
                self.nameTxtField.becomeFirstResponder()
            }
        }
        else {
            UIView.animate(withDuration: 0.2, animations: {
                self.blurView.alpha = 0
                self.newEventView.alpha = 0
            }) { (nil) in
                self.blurView.isHidden = true
                self.newEventView.isHidden = true
                self.cancelBtn.isHidden = true
                
                self.upperRightBtn.setTitle("+", for: .normal)
                self.upperRightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 40)
                
                self.clearTxtFields()
                
                self.view.endEditing(true)
            }
        }
    }
    
    //------------------------UITableView functions------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EventsManager.instance.getEvents().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = eventTableView.dequeueReusableCell(withIdentifier: "eventCell") as! EventCell
        
        cell.updateView(event: EventsManager.instance.getEvents()[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            eventTableView.beginUpdates()
            EventsManager.instance.removeEvent(at: indexPath.row)
            eventTableView.deleteRows(at: [indexPath], with: .left)
            eventTableView.endUpdates()
        }
    }
    
    //------------------------------------------------------------------------
    //------------------------UIPickerView functions------------------------
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DataBaseHandler.instance.getLocations().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return DataBaseHandler.instance.getLocations()[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        placeTxtField.text = DataBaseHandler.instance.getLocations()[row]
    }
    
    //------------------------------------------------------------------------

    @IBAction func plusBtnPressed(_ sender: Any) {
        switchMode()
        
        if(currentMode == .idle)
        {
            if(nameTxtField.text == "" || timeTxtField.text == "" || placeTxtField.text == "") {
                showEmptyTxtFieldError()
                switchMode() //switches mode back
                return
            }
            
            EventsManager.instance.createEvent(name: nameTxtField.text!, time: timeTxtField.text!, location: placeTxtField.text!, note: noteTxtField.text!)
            eventTableView.reloadData()
        }
        
        updateView(for: currentMode)

    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        switchMode()
        updateView(for: currentMode)
    }
    
}
