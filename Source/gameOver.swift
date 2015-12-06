//
//  CCNode.swift
//  RollGoal
//
//  Created by Brandon Troche on 12/5/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class gameOver: CCNode {
    
    weak var scoreLabel: CCLabelTTF!
    
    func restart(){
        let scene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(scene)
    }
    
    func setScore(score:Int){
        scoreLabel.string = "\(score)"
    }
    

}
