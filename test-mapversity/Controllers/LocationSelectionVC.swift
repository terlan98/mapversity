//
//  LocationSelectionVC.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 11/10/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

class LocationSelectionVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var currentLocationTxtField: LocationTextField!
    @IBOutlet weak var destinationTxtField: LocationTextField!
    @IBOutlet weak var locationTableView: UITableView!
    
    enum State: String
    {
        case idle //user has not activated any txt field
        case currentLocation //user has activated currentLocationTxtField
        case destination //user has activated destinationTxtField
    }
    
    var currentState: State = .idle //keeps track of which txt field is active (if any)
    var locations = ["Lobby A","A101","A102","A103","A104","A105","A201","A202","A203"]
    var locationsToShow = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationTableView.delegate = self
        locationTableView.dataSource = self
        destinationTxtField.delegate = self
        currentLocationTxtField.delegate = self
        
        locationsToShow = locations
    }
    
    ///Shows an alert asking for the confirmation of the selected origin and destination points by the user
    func showConfirmationAlert() {
        
        let alert = UIAlertController(title: "Confirmation", message: "Do you want to go to \(destinationTxtField.text!) from \(currentLocationTxtField.text!)?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: startNavigation))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
    
    ///Passes the selected points to the previous VC and dismisses itself.
    func startNavigation(alert: UIAlertAction!)
    {
        //TODO: Pass selected points to the previous VC
        
        dismiss(animated: true, completion: nil)
    }
    
    ///Called if the user decided to cancel (by pressing the back button)
    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //------------------------UITableView functions------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if currentState == .idle { return 0 }
        
        return locationsToShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LCell") as! LocationCell
        
        cell.updateView(location: locationsToShow[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedCell = tableView.cellForRow(at: indexPath) as! LocationCell
        
        if currentState == .currentLocation //if user selected the location as current location
        {
            currentLocationTxtField.text = selectedCell.locationLabel.text
            
            if !destinationTxtField.text!.isEmpty //if destination is already entered, ask for confirmation
            {
                showConfirmationAlert()
            }
            else //move focus to destinationTxtField
            {
                destinationTxtField.becomeFirstResponder()
            }
        }
        else //if user selected the location as a destination
        {
            destinationTxtField.text = selectedCell.locationLabel.text
            
            if !currentLocationTxtField.text!.isEmpty
            {
                showConfirmationAlert()
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true) //so that the row wouldn't remain selected
    }
    
    //------------------------------------------------------------------------
    
    //------------------------UITextField functions------------------------
    //Used for determining the currentState (which is needed for updating tableView)
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.isEqual(destinationTxtField)
        {
            currentState = .destination
        }
        else
        {
            currentState = .currentLocation
        }
                
        locationTableView.reloadData()
    }
    
    //Reset locationsToShow if the user tapped on another txt field
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        locationsToShow = locations
        locationTableView.reloadData()
    }
    
    //Search functionality (called whenever a UITextField is changed
    @IBAction func txtFieldChanged(_ sender: UITextField) {
        if sender.text!.isEmpty //no need to search with empty string
        {
            locationsToShow = locations
            locationTableView.reloadData()
            return
        }
        
        locationsToShow = locations.filter { $0.contains(sender.text!) }
        locationTableView.reloadData()
    }
    
}
