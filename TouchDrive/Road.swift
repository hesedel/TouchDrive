//
//  Road.swift
//  TouchDrive
//
//  Created by Hesedel on 8/2/15.
//  Copyright (c) 2015 Pajaron Creative. All rights reserved.
//

import SpriteKit

class Road {
    var width = CGFloat();
    var height = CGFloat();
    let node = SKNode();
    var roads = [SKShapeNode]();
    
    func load() {
        var road = SKShapeNode(rectOfSize:CGSize(width:width, height:height));
        
        road.fillColor = UIColor(red:255, green:0, blue:255, alpha:1);
        road.strokeColor = UIColor(red:0, green:0, blue:255, alpha:1);
        road.position = CGPoint(x:0, y:(height/2) + (height * CGFloat(roads.count)));
        roads.append(road);
        node.addChild(roads[roads.count - 1]);
        
        println(String(node.children.count) + " roads present");
    }
    
    func unload() {
        if (roads.count-3 >= 0) {
            roads[roads.count-3].removeFromParent();
        }
        
        println(String(node.children.count) + " roads present");
    }
}
