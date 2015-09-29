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
    
    func left(){
        player.physicsBody.applyImpulse(ccp(-75, 0)) //Instead of using gravity I have decided to apply impulses instead as it keeps things simpler and it has a nice effect similar to what I would like to convey.
    }
    
    func right(){
        player.physicsBody.applyImpulse(ccp(75, 0)) //In case it is not clear this apply an impulse on the x axis where as positive numbers send it to the right and negative number send it to the left.

    }

}

