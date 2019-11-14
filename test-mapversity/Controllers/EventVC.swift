//
//  EventController.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 11/12/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

class EventVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var eventTableView: UITableView!
    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var newEventView: UIView!
    @IBOutlet weak var upperRightBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        eventTableView.delegate = self
        eventTableView.dataSource = self
    }
    
    //------------------------UITableView functions------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getEvents().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = eventTableView.dequeueReusableCell(withIdentifier: "eventCell") as! EventCell
        
        cell.updateView(event: DataService.instance.getEvents()[indexPath.row])
        
        return cell
    }
    
    //------------------------------------------------------------------------

    
    @IBAction func plusBtnPressed(_ sender: Any) {
        
        self.blurView.isHidden = false
        self.blurView.alpha = 0

        self.newEventView.isHidden = false
        self.newEventView.alpha = 0
        
        UIView.animate(withDuration: 0.2) {
            self.blurView.alpha = 100
            self.newEventView.alpha = 100
        }
        
        //TODO: Improve this part
        upperRightBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        upperRightBtn.setTitle("DONE", for: .normal)
    }
}
