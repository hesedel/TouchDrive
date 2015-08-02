//
//  Vehicle.swift
//  TouchDrive
//
//  Created by Hesedel on 8/2/15.
//  Copyright (c) 2015 Pajaron Creative. All rights reserved.
//

import SpriteKit

class Vehicle {
    var width = CGFloat(40);
    var node = SKShapeNode();
    
    init() {
        node = SKShapeNode(rectOfSize:CGSize(width:width, height:100));
    }
}
