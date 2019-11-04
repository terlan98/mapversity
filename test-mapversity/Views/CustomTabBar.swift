//
//  CustomTabBar.swift
//  test-mapversity
//
//  Created by Tarlan Ismayilsoy on 11/4/19.
//  Copyright © 2019 Tarlan Ismayilsoy. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBar {
    //Note: Font related customizations are inside AppDelegate.
    
    
    override func sizeThatFits(_ size: CGSize) -> CGSize { // Gives custom size to the tab bar
        return CGSize(width: super.sizeThatFits(size).width, height: 87)
    }
}
