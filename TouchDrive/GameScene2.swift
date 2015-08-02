//
//  GameScene2.swift
//  TouchDrive
//
//  Created by Hesedel on 8/2/15.
//  Copyright (c) 2015 Pajaron Creative. All rights reserved.
//

import SpriteKit

class GameScene2: SKScene {
    let road = SKNode()
    var roads = [SKShapeNode]()
    let myCar = SKShapeNode(rectOfSize:CGSize(width:50, height:100))
    let myControl = SKShapeNode(circleOfRadius:25)
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        //let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        //myLabel.text = "Hello, World!";
        //myLabel.fontSize = 65;
        //myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        //self.addChild(myLabel)
        
        road.position = CGPoint(x:CGRectGetMidX(self.frame), y:0);
        self.addChild(road)
        
        roads.append(SKShapeNode(rectOfSize:CGSize(width:100, height:self.frame.height)))
        roads[roads.count-1].fillColor = UIColor(red:0, green:0, blue:255, alpha:1);
        roads[roads.count-1].strokeColor = UIColor(red:0, green:0, blue:255, alpha:1);
        roads[roads.count-1].position = CGPoint(x:0, y:CGRectGetMidY(self.frame));
        road.addChild(roads[roads.count-1])
        
        myCar.fillColor = UIColor(red:255, green:0, blue:0, alpha:1);
        myCar.strokeColor = UIColor(red:255, green:0, blue:0, alpha:1);
        myCar.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myCar)
        
        myControl.fillColor = UIColor(red:0, green:255, blue:0, alpha:1);
        myControl.strokeColor = UIColor(red:0, green:255, blue:0, alpha:1);
        myControl.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)-100);
        
        self.addChild(myControl)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            
            //let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            //sprite.xScale = 0.5
            //sprite.yScale = 0.5
            //sprite.position = location
            
            //let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            //sprite.runAction(SKAction.repeatActionForever(action))
            
            //self.addChild(sprite)
        }
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            
            myControl.position = location
            myCar.position = CGPoint(x:location.x, y:location.y+100)
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        road.position.y -= 10
        
        loadRoad()
    }
    
    func loadRoad() {
        if (roads.count - 1 == Int(floor(abs(road.position.y) / self.frame.height))) {
            println(String(roads.count - 1) + " road loaded")
            roads.append(SKShapeNode(rectOfSize:CGSize(width:100, height:self.frame.height)))
            roads[roads.count-1].fillColor = UIColor(red:0, green:255, blue:255, alpha:1);
            roads[roads.count-1].strokeColor = UIColor(red:0, green:0, blue:255, alpha:1);
            roads[roads.count-1].position = CGPoint(x:0, y:CGRectGetMidY(self.frame) + (self.frame.height * CGFloat(roads.count-1)));
            road.addChild(roads[roads.count-1])
        }
    }
}
