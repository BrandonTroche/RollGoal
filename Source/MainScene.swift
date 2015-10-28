import Foundation

/*
Notes:
    Negative x value gravity pushes <--- this way
    Positive x value gravity pushes ---> this way

    Bounding positions on boundaries are x = 38.4 on the left and x = 345.6
    The distance between the boundaries in terms of the x-axis is 307.2
*/

class MainScene: CCNode, CCPhysicsCollisionDelegate {

    weak var gamePhysicsNode:CCPhysicsNode!
    weak var player:CCSprite!
    
    var sinceSpawn:CCTime = 0
    
    func didLoadFromCCB() {
        userInteractionEnabled = true       //Start user interaction
        gamePhysicsNode.debugDraw = true    //Show outline of all physics bodies
       /* spawnFloorSequenceOne(80)
        spawnFloorSequenceTwo(100)
        spawnFloorSequenceThree(120)
        spawnFloorSequenceFour(140)
        spawnFloorSequenceFive(190)*/
        spawnFloorSequenceTwo(0)


    }
    
    func spawnFloorSequenceOne(var x: Int){
        var aFloor = CCBReader.load("Floor") as! Floor
        gamePhysicsNode.addChild(aFloor)
        aFloor.position = ccp(96, CGFloat(x))
    }
    
    func spawnFloorSequenceTwo(var x: Int){
        var aFloor = CCBReader.load("Floor2") as! Floor
        gamePhysicsNode.addChild(aFloor)
        aFloor.position = ccp(40, CGFloat(x))
    }
    
    func spawnFloorSequenceThree(var x: Int){
        var aFloor = CCBReader.load("Floor") as! Floor
        gamePhysicsNode.addChild(aFloor)
        aFloor.position = ccp(120, CGFloat(x))
    }
    
    func spawnFloorSequenceFour(var x: Int){
        var aFloor = CCBReader.load("Floor") as! Floor
        gamePhysicsNode.addChild(aFloor)
        aFloor.position = ccp(100, CGFloat(x))
    }
    
    func spawnFloorSequenceFive(var x: Int){
        var aFloor = CCBReader.load("Floor") as! Floor
        gamePhysicsNode.addChild(aFloor)
        aFloor.position = ccp(80, CGFloat(x))
    }
    
    func spawn(){
        let randNumber = CGFloat(arc4random_uniform(100))//Generate a random number from 0 to 100, depending on the number then I spawn one of the pre-set floors.
        if (randNumber <= 20) {
            spawnFloorSequenceOne(0)
        } else if (randNumber <= 40) && (randNumber > 20){
            spawnFloorSequenceTwo(0)
        } else if (randNumber <= 60) && (randNumber > 40){
            spawnFloorSequenceThree(0)
        } else if (randNumber <= 80) && (randNumber > 60){
            spawnFloorSequenceFour(0)
        } else if (randNumber <= 100) && (randNumber > 80){
            spawnFloorSequenceFive(0)
        }
    }
    
    
    override func update(delta: CCTime) {
        sinceSpawn += delta
        if(sinceSpawn > 3){
            //spawn()
            //spawnFloorSequenceOne(0)
            spawnFloorSequenceTwo(0)
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

