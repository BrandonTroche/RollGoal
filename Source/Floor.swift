//
//  Floor.swift
//  RollGoal
//
//  Created by Brandon Troche on 10/7/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

var velocity = 1.0      //Global variable to allow for altering in other classes

class Floor: CCSprite {
    
    override func update(delta: CCTime) {
        
        
        self.position.y += CGFloat(velocity)
        
    
    }
    
}
