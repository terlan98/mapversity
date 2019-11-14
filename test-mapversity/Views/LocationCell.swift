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
        backView.applyShadowAndRounding(shadowRadius: 2, shadowOffset: .zero, shadowOpacity: 0.2, cornerRadius: 7)
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
