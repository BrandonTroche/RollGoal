import Foundation

class MainScene: CCNode {

    weak var clickYo:CCNodeGradient!
    
    
    func didLoadFromCCB() {
        userInteractionEnabled = true
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!){
        var color:CCColor! = CCColor(red:20.0/255, green:120.0/255, blue:120.0/255)

        clickYo.color = color
        
    }
}
