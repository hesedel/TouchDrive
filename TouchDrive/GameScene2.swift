//
//  GameScene2.swift
//  TouchDrive
//
//  Created by Hesedel on 8/2/15.
//  Copyright (c) 2015 Pajaron Creative. All rights reserved.
//

import SpriteKit

class GameScene2: SKScene {
    var width = CGFloat();
    var height = CGFloat();
    
    let road = Road();
    let myVehicle = MyVehicle();
    let myController = MyController();
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        width = UIScreen.mainScreen().bounds.width;
        height = width * (4 / 3);
        
        road.node.position = CGPoint(x: CGRectGetMidX(self.frame), y: 0);
        
        self.addChild(road.node);
        
        road.width = width / 5;
        road.height = height;
        road.load();
        
        myVehicle.setWidth(width / 15);
        myVehicle.node.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame));
        previousLocationX = myVehicle.node.position.x;
        
        self.addChild(myVehicle.node);
        
        myController.node.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame) - (height / 3));
        
        self.addChild(myController.node);
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self);
            
            //let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            //sprite.xScale = 0.5
            //sprite.yScale = 0.5
            //sprite.position = location
            
            //let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            //sprite.runAction(SKAction.repeatActionForever(action))
            
            //self.addChild(sprite)
        }
    }
    
    var previousLocationX = CGFloat();
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self);
            
            myController.node.position = location;
            myVehicle.node.position = CGPoint(x: location.x, y: location.y + (height / 3));
            
            var change = (previousLocationX - location.x) / (width / 30);
            
            var turn = SKAction.rotateByAngle(CGFloat(change), duration: NSTimeInterval(0));
            myVehicle.node.runAction(turn);
            
            previousLocationX = location.x;
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        var equalize = SKAction.rotateToAngle(CGFloat(0), duration: NSTimeInterval(1));
        myVehicle.node.runAction(equalize);
        
        road.node.position.y -= 1;
        
        loadRoad();
    }
    
    func loadRoad() {
        var level = Int(floor(abs(road.node.position.y) / height));
        
        if (road.roads.count == level) {
            road.unload();
        }
        
        if (road.roads.count - 1 == level) {
            println(String(road.roads.count - 1) + " road loaded");
            road.load();
            road.unload();
        }
    }
}
