import Foundation

/*Notes:
    Negative x value gravity pushes <--- this way
    Positive x value gravity pushes ---> this way
*/

class MainScene: CCNode, CCPhysicsCollisionDelegate {

    weak var gamePhysicsNode:CCPhysicsNode!
    weak var player:CCSprite!
    
    var sinceSpawn:CCTime = 0
    
    func didLoadFromCCB() {
        userInteractionEnabled = true       //Start user interaction
        gamePhysicsNode.debugDraw = true    //Show outline of all physics bodies
        spawnFloorSequenceOne()
        spawnFloorSequenceTwo()

    }
    
    func spawnFloorSequenceOne(){
        var aFloor = CCBReader.load("Floor") as! Floor
        gamePhysicsNode.addChild(aFloor)
        aFloor.position = ccp(96, 140)
    }
    
    func spawnFloorSequenceTwo(){
        var aFloor = CCBReader.load("Floor") as! Floor
        gamePhysicsNode.addChild(aFloor)
        aFloor.position = ccp(38, 275)
    }
    
    func spawnFloorSequenceThree(){
        var aFloor = CCBReader.load("Floor") as! Floor
        gamePhysicsNode.addChild(aFloor)
        aFloor.position = ccp(96, 364)
    }
    
    func spawnFloorSequenceFour(){
        var aFloor = CCBReader.load("Floor") as! Floor
        gamePhysicsNode.addChild(aFloor)
        aFloor.position = ccp(100, 400)
    }
    
    func spawnFloorSequenceFive(){
        var aFloor = CCBReader.load("Floor") as! Floor
        gamePhysicsNode.addChild(aFloor)
        aFloor.position = ccp(80, 180)
    }
    
    func spawn(){
        let randNumber = CGFloat(arc4random_uniform(100))//Generate a random number from 0 to 100, depending on the number then I spawn one of the pre-set floors.
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
        sinceSpawn += delta
        if(sinceSpawn > 3){
            //spawn()
            spawnFloorSequenceOne()
            sinceSpawn = 0
        }
    }
    
    
    func left(){
        player.physicsBody.applyImpulse(ccp(-75, 0)) //Instead of using gravity I have decided to apply impulses instead as it keeps things simpler and it has a nice effect similar to what I would like to convey.
    }
    
    func right(){
        player.physicsBody.applyImpulse(ccp(75, 0)) //In case it is not clear this apply an impulse on the x axis where as positive numbers send it to the right and negative number send it to the left.

    }

}

