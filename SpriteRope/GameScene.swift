//
//  GameScene.swift
//  SpriteRope
//
//  Created by Rafael Moura on 12/02/16.
//  Copyright (c) 2016 Rafael Moura. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var rope: RMSpriteRope!
    
    override func didMoveToView(view: SKView) {
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        let attachmentNode = SKSpriteNode(color: UIColor.greenColor(), size: CGSize(width: 20, height: 20))
        attachmentNode.physicsBody = SKPhysicsBody(rectangleOfSize: attachmentNode.size)
        attachmentNode.physicsBody?.affectedByGravity = false
        attachmentNode.physicsBody?.dynamic = false
        
        addChild(attachmentNode)
        
        rope = RMSpriteRope(withLength: 20, andNodeTexture: SKTexture(imageNamed: "rope_node"))
        rope.attachToNode(attachmentNode)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let tail = rope.tailNode{
            tail.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 0), atPoint: CGPoint(x: CGRectGetMidX(tail.frame), y: CGRectGetMinY(tail.frame)))
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
