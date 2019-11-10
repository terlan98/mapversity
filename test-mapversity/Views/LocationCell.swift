//
//  LocationCell.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 11/10/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

class LocationCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customize()
    }
    
    func customize()
    {
        backView.layer.masksToBounds = false
        
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowRadius = 2
        backView.layer.shadowOffset = .zero
        backView.layer.shadowOpacity = 0.2
        
        backView.layer.cornerRadius = 7
        
    }
    
    func updateView(location: String)
    {
        locationLabel.text = location
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
