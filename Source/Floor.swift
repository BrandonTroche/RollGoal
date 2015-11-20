//
//  Floor.swift
//  RollGoal
//
//  Created by Brandon Troche on 10/7/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Floor: CCSprite {
    
    override func update(delta: CCTime) {
        var velocity = 1.0
        
        self.position.y += CGFloat(velocity)
        
    
    }
    
}
