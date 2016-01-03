import Foundation

/*
Notes:
    Negative x value gravity pushes <--- this way
    Positive x value gravity pushes ---> this way

    Bounding positions on boundaries are x = 38.4 on the left and x = 345.6
    The distance between the boundaries in terms of the x-axis is 307.2

    A good y value for algorithm is an interval of 120 between platforms

*/

enum CurrentGameState{
    case playing, paused
}


class MainScene: CCNode, CCPhysicsCollisionDelegate {

    weak var gamePhysicsNode:CCPhysicsNode!
    weak var player:CCSprite!
    weak var scoreLabel:CCLabelTTF!
    weak var topBoundary:CCNode!
    weak var gameOverUI: gameOver!
    
    var floorQueue = [CCNode]() /* "Queue" for pushing and popping floors from the physics node to make
                                    for easier adding of parent and removing from parent in the right
                                    order. This is implemented as an array for simplicity.
    
                                    My reasoning for this is floors are spawned in order and rather than 
                                    removing these floors from the parent as the collide with some physics
                                    body I can simply call a custom "pop()" function on this or any other
                                    case that I should decide to do so.
                                */
    
    var sinceSpawn:CCTime = 0
    var currentPoints = 0
    var gameState: CurrentGameState = .playing
    var spawnDelay:CCTime = 5

    
    func didLoadFromCCB() {
        userInteractionEnabled = true       //Start user interaction
        //gamePhysicsNode.debugDraw = true    //Show outline of all physics bodies
        topBoundary.physicsBody.sensor = true
        spawn(415)
        spawn(290)
        spawn(174)
        spawn(50)
        print(floorQueue[floorQueue.count - 1])
        gamePhysicsNode.collisionDelegate = self    //Set the collisions on, without this collisions won't trigger
        velocity = 1.0

    }
    
    func spawnFloorSequenceOne(var y: Int){
        var aFloor = CCBReader.load("Floor") as! Floor
        aFloor.scaleX = 0.45                        //Scale the image on load in as the assets are rather large and need to
        aFloor.scaleY = 0.42                        //be altered to be able to fit on the screen.
        parentPhysics(aFloor)
        push(aFloor)
        aFloor.position = ccp(20, CGFloat(y))
    }
    
    func spawnFloorSequenceTwo(var y: Int){
        var aFloor = CCBReader.load("Floor2") as! Floor
        aFloor.scaleX = 0.23
        aFloor.scaleY = 0.50
        parentPhysics(aFloor)
        push(aFloor)
        //gamePhysicsNode.addChild(aFloor)
        aFloor.position = ccp(30, CGFloat(y))
    }
    
    func spawnFloorSequenceThree(var y: Int){
        var aFloor = CCBReader.load("Floor3") as! Floor
        aFloor.scaleX = 0.45
        aFloor.scaleY = 0.42
        parentPhysics(aFloor)
        push(aFloor)
        aFloor.position = ccp(75, CGFloat(y))
    }
    
    func spawnFloorSequenceFour(var y: Int){
        var aFloor = CCBReader.load("Floor4") as! Floor
        aFloor.scaleX = 0.10
        aFloor.scaleY = 0.26
        parentPhysics(aFloor)
        push(aFloor)
        aFloor.position = ccp(30, CGFloat(y))
    }
    
    /*func spawnFloorSequenceFive(var y: Int){
        var aFloor = CCBReader.load("Floor5") as! Floor
        parentPhysics(aFloor)
        push(aFloor)
        aFloor.position = ccp(80, CGFloat(y))
    }*/
    
    func parentPhysics(var x: CCNode!){
        gamePhysicsNode.addChild(x)
    }
    
    func push(var x:CCNode!){
        floorQueue.append(x)
    }
    
    func pop(){
        floorQueue.removeAtIndex(0)
    }
    
    func spawn(var y: Int){
        let randNumber = CGFloat(arc4random_uniform(60))//Generate a random number from 0 to 100, depending on the number then I spawn one of the pre-set floors.
        if (randNumber <= 20) {
            spawnFloorSequenceOne(y)
        } else if (randNumber <= 40) && (randNumber > 20){
            spawnFloorSequenceTwo(y)
        } else if (randNumber <= 60) && (randNumber > 40){
            spawnFloorSequenceThree(y)
        } /*else if (randNumber <= 80) && (randNumber > 60){
            spawnFloorSequenceFour(y)
        } else if (randNumber <= 100) && (randNumber > 80){
            spawnFloorSequenceFive(0)
        }*/
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, hero: CCSprite!, goal: CCNode!) -> ObjCBool {
        goal.removeFromParent()
        currentPoints++
        scoreLabel.string = String(currentPoints)
        println("Collision happened")
        return true
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, hero: CCNode!, death: CCNode!) -> ObjCBool {
        gameOverUI.setScore(currentPoints)
        self.animationManager.runAnimationsForSequenceNamed("gameOver")
        gamePhysicsNode.paused = true
        gameState = .paused
        return true
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, floor: CCNode!, death: CCNode!) -> ObjCBool {
        gamePhysicsNode.removeChild(floorQueue[0])
        pop()
        //print(floorQueue.count)
        return true
    }
    
    override func update(delta: CCTime) {
        if(gameState == .playing){
       
            sinceSpawn += delta
           
                if(sinceSpawn > CCTime(spawnDelay)){
                    spawn(0)
                    //spawnFloorSequenceOne(0)
                    //spawnFloorSequenceTwo(0)
                    print(floorQueue[floorQueue.count - 1])
           
                    sinceSpawn = 0
                    spawnDelay -= 0.2
                    velocity += 0.5
            
            }
        }
    }
    
    
    func left(){
        player.physicsBody.applyImpulse(ccp(-127500, 0)) //Instead of using gravity I have decided to apply impulses instead as it keeps things simpler and it has a nice effect similar to what I would like to convey.
    }
    
    func right(){
        player.physicsBody.applyImpulse(ccp(127500, 0)) //In case it is not clear this apply an impulse on the x axis where as positive numbers send it to the right and negative number send it to the left.

    }

}

