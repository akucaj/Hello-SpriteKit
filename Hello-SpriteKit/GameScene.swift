//
//  GameScene.swift
//  Hello-SpriteKit
//
//  Created by Artur Kucaj on 02/10/15.
//  Copyright (c) 2015 Artur Kucaj. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, SpriteKit!";
        myLabel.fontSize = 25;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            let moveUp = SKAction.moveByX(0, y: 100.0, duration: 0.5)
            let zoom = SKAction.scaleTo(1.0, duration: 0.25)
            let pause = SKAction.waitForDuration(0.5)
            let fadeAway = SKAction.fadeOutWithDuration(0.25)
            let remove = SKAction.removeFromParent()
            
            let sequences = SKAction.sequence([action, moveUp, zoom, pause, fadeAway, remove])
            sprite.runAction(sequences)
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
