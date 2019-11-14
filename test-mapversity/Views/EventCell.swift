//
//  EventCell.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 11/14/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var midView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customize()
    }
    
    func customize() {
        backView.applyShadowAndRounding(shadowRadius: 2, shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 0.3, cornerRadius: 10)
    }
    
    ///Updates the view according to the given Event instance
    func updateView(event: Event)
    {
        nameLabel.text = event.name
        timeLabel.text = event.time
        locationLabel.text = event.location
        
        midView.backgroundColor = DataService.instance.getRandomColor()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
