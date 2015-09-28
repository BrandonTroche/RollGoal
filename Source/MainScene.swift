import Foundation

/*Notes:
    Negative x value gravity pushes <--- this way
    Positive x value gravity pushes ---> this way
*/

class MainScene: CCNode, CCPhysicsCollisionDelegate {

//    weak var gamePhysicsNode:CCPhysicsNode!
    weak var gamePhysicsNode:CCPhysicsNode!
    weak var left:LeftButton!
    weak var right:RightButton!
    
    var gravity: Int = 0
    
    
    func didLoadFromCCB() {
        userInteractionEnabled = true       //Start user interaction
        gamePhysicsNode.debugDraw = true    //Show outline of all physics bodies
    }
    
//    override func update(delta: CCTime) {
//        gravity = left.
//        gamePhysicsNode.gravity.x = gravity
//    }
    
//    func Left(){
//        self.gamePhysicsNode.gravity.x += -600    //placeholder test for negative gravity influence
//        println(gamePhysicsNode.gravity.x)      //print to console to check the value is changing
//    }
    
//    func Right(){
//        self.gamePhysicsNode.gravity.x += 600        //placeholder test for positive gravity influence
//        println(gamePhysicsNode.gravity.x)      //print to console to check the value is changing
//    }
    
//    func Reset(){
//        gamePhysicsNode.gravity.x = 0      //reset horizontal gravity to 0 for play testing purposes
//    }

}

