import Foundation

/*Notes:
    Negative x value gravity pushes <--- this way
    Positive x value gravity pushes ---> this way
*/

class MainScene: CCNode {

    weak var clickYo:CCNodeGradient!
    weak var gamePhysicsNode:CCPhysicsNode!
    
    func didLoadFromCCB() {
        userInteractionEnabled = true       //Start user interaction
        gamePhysicsNode.debugDraw = true        //Show outline of all physics bodies
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!){
        var color:CCColor! = CCColor(red:20.0/255, green:120.0/255, blue:120.0/255)

        clickYo.color = color
        
    }
    
    func Left(){
        gamePhysicsNode.gravity.x += -20    //placeholder test for negative gravity influence
        println(gamePhysicsNode.gravity.x)      //print to console to check the value is changing
    }
    
    func Right(){
        gamePhysicsNode.gravity.x += 20        //placeholder test for positive gravity influence
        println(gamePhysicsNode.gravity.x)      //print to console to check the value is changing

    }
    
    func Reset(){
        gamePhysicsNode.gravity.x = 0       //reset horizontal gravity to 0 for play testing purposes 
    }
    
}
