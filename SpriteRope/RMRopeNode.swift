//
//  RMRopeNode.swift
//  SpriteRope
//
//  Created by Rafael Moura on 12/02/16.
//  Copyright © 2016 Rafael Moura. All rights reserved.
//

import SpriteKit

class RMRopeNode: SKSpriteNode {
    
    init(nodeTexture: SKTexture){
        super.init(texture: nodeTexture, color: UIColor(), size: nodeTexture.size())
        
        self.anchorPoint = CGPoint(x: 0.5, y: 1)
        self.physicsBody = SKPhysicsBody(rectangleOfSize: self.size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
