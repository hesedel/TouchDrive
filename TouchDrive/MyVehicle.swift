//
//  MyVehicle.swift
//  TouchDrive
//
//  Created by Hesedel on 8/2/15.
//  Copyright (c) 2015 Pajaron Creative. All rights reserved.
//

import SpriteKit

class MyVehicle: Vehicle {
    override init() {
        super.init();
        
        node.fillColor = UIColor(red:255, green:0, blue:0, alpha:1);
        node.strokeColor = UIColor(red:255, green:0, blue:0, alpha:1);
    }
}
