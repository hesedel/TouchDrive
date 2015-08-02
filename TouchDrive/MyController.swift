//
//  MyController.swift
//  TouchDrive
//
//  Created by Hesedel on 8/2/15.
//  Copyright (c) 2015 Pajaron Creative. All rights reserved.
//

import SpriteKit

class MyController {
    let node = SKShapeNode(circleOfRadius:25);
    
    init() {
        node.fillColor = UIColor(red:0, green:255, blue:0, alpha:1);
        node.strokeColor = UIColor(red:0, green:255, blue:0, alpha:1);
    }
}
