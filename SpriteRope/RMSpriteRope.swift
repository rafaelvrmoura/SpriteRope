//
//  RMSpriteRope.swift
//  SpriteRope
//
//  Created by Rafael Moura on 12/02/16.
//  Copyright © 2016 Rafael Moura. All rights reserved.
//

import SpriteKit

class RMSpriteRope: SKNode {
    
    private var ropeNodes = [RMRopeNode]()
    
    var headNode: RMRopeNode?{
        get{
            return ropeNodes.first
        }
    }
    
    var tailNode: RMRopeNode?{
        get{
            return ropeNodes.last
        }
    }
    
    init(withLength length: CGFloat, andNodeTexture nodeTexture: SKTexture) {
        super.init()
        
        let numOfNodes = Int(ceil(length))
        
        for i in 0...numOfNodes {
            let node = RMRopeNode(nodeTexture: nodeTexture)
            node.position.y = (-CGFloat(i)*node.size.height)
            
            self.addChild(node)
            self.ropeNodes.append(node)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func applyPhysicsOnWorld(world: SKPhysicsWorld){
        if let scene = self.scene {
            for i in 0..<(ropeNodes.count-1) {
                let nodeA = ropeNodes[i]
                let nodeB = ropeNodes[i+1]
                
                let attachmentPoint = scene.convertPoint(CGPoint(x: CGRectGetMidX(nodeA.frame), y: CGRectGetMinY(nodeA.frame)), fromNode: nodeA.parent!)
                
                let joint = SKPhysicsJointPin.jointWithBodyA(nodeA.physicsBody!, bodyB: nodeB.physicsBody!, anchor: attachmentPoint)
                joint.shouldEnableLimits = true
                joint.lowerAngleLimit = 0
                joint.upperAngleLimit = 0
                world.addJoint(joint)
            }
        }
    }
    
    func attachToNode(node: SKNode){
        
        if let attachmentBody = node.physicsBody, scene = node.scene where ropeNodes.count > 0{
            let ropeHeadNode = ropeNodes[0]
            
            let attachmentPoint = scene.convertPoint(CGPoint(x: CGRectGetMidX(node.frame), y: CGRectGetMinY(node.frame)), fromNode: node.parent!)
            let joint = SKPhysicsJointPin.jointWithBodyA(attachmentBody, bodyB: ropeHeadNode.physicsBody!, anchor: attachmentPoint)
            
            node.addChild(self)
            
            let world = scene.physicsWorld
            world.addJoint(joint)
            self.applyPhysicsOnWorld(world)
        }
    }
    
    func attachNode(node: SKNode){
    
    }
}
