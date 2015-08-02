//
//  Vehicle.swift
//  TouchDrive
//
//  Created by Hesedel on 8/2/15.
//  Copyright (c) 2015 Pajaron Creative. All rights reserved.
//

import SpriteKit

class Vehicle {
    var node = SKShapeNode();
    var body = SKShapeNode();
    
    init () {
        node.addChild(body);
    }
    
    func setWidth(width: CGFloat) {
        node.path = SKShapeNode(circleOfRadius: width / 2).path;
        body.path = SKShapeNode(rectOfSize: CGSize(width: width, height: width * 2)).path;
        body.position.y = -(width / 2);
    }
}
