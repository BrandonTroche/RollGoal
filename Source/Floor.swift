//
//  Floor.swift
//  RollGoal
//
//  Created by Brandon Troche on 10/7/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Floor: CCNode {
    
    override func update(delta: CCTime) {
        self.position.y += 1
    }
    
}
