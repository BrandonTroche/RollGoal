import Foundation

/*Notes:
    Negative x value gravity pushes <--- this way
    Positive x value gravity pushes ---> this way
*/

class MainScene: CCNode, CCPhysicsCollisionDelegate {

    weak var gamePhysicsNode:CCPhysicsNode!
    weak var player:CCSprite!
    
    func didLoadFromCCB() {
        userInteractionEnabled = true       //Start user interaction
        gamePhysicsNode.debugDraw = true    //Show outline of all physics bodies
    }
    
    func spawnFloorSequenceOne(){
      //  gamePhysicsNode.addChild()
    }
    
    func spawnFloorSequenceTwo(){
        
    }
    
    func spawnFloorSequenceThree(){
        
    }
    
    func spawnFloorSequenceFour(){
        
    }
    
    func spawnFloorSequenceFive(){
        
    }
    
    func spawn(){
        let randNumber = CGFloat(arc4random_uniform(100))
        if (randNumber <= 20) {
            spawnFloorSequenceOne()
        } else if (randNumber <= 40) && (randNumber > 20){
            spawnFloorSequenceTwo()
        } else if (randNumber <= 60) && (randNumber > 40){
            spawnFloorSequenceThree()
        } else if (randNumber <= 80) && (randNumber > 60){
            spawnFloorSequenceFour()
        } else if (randNumber <= 100) && (randNumber > 80){
            spawnFloorSequenceFive()
        }
    }
    
    
    override func update(delta: CCTime) {
        spawn();
    }
    
    
    func left(){
        player.physicsBody.applyImpulse(ccp(-75, 0)) //Instead of using gravity I have decided to apply impulses instead as it keeps things simpler and it has a nice effect similar to what I would like to convey.
    }
    
    func right(){
        player.physicsBody.applyImpulse(ccp(75, 0)) //In case it is not clear this apply an impulse on the x axis where as positive numbers send it to the right and negative number send it to the left.

    }

}

