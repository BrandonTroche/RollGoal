//
//  LeftButton.swift
//  RollGoal
//
//  Created by Brandon Troche on 9/27/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class LeftButton: CCNode {
    
    func returnGravity()->Int {
        return (-600)
    }
    
    func returnReset()->Int{
        return (0)
    }
   
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        returnGravity()
    }
    
    override func touchEnded(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        returnReset()
    }
    
}
