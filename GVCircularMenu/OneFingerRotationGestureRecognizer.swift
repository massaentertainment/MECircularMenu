//
//  OneFingerRotationGestureRecognizer.swift
//  GVCircularMenu
//
//  Created by Gabriel Bezerra Valério on 02/06/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit.UIGestureRecognizerSubclass

class OneFingerRotationGestureRecognizer : UIGestureRecognizer {
    
    var currentAngle:CGFloat = 0.0
    var previousAngle:CGFloat = 0.0
    var center:CGPoint = .zero
    
    var target:Any?
    var selector:Selector?
    
    override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
        
        self.target = target
        self.selector = action
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        
        guard touches.count == 1 else {
            self.state = .failed
            return
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        
        let touch = touches.first!
        
        currentAngle = getAngle(touch.location(in: touch.view))
        previousAngle = getAngle(touch.previousLocation(in: touch.view))
        
        let castedTarget = target as AnyObject
        if let action = selector {
            if castedTarget.responds(to: action) {
                _ = castedTarget.perform(action, with: self)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        
        state = .ended
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesCancelled(touches, with: event)
        
        state = .cancelled
    }
    
    func getAngle(_ location:CGPoint) -> CGFloat{
        let x = location.x - center.x
        let y = -(location.y - center.y)
        
        guard y != 0 else {
            if x > 0 {
                return 2.0 * .pi
            }
            return 3 * .pi / 2
        }
        
        let arctan = CGFloat(atan(y/x))
        
        switch (x, y){
        case (let cx, let cy) where cx >= 0 && cy > 0:
            return arctan
        case (let cx, let cy) where cx < 0 && cy > 0:
            return arctan + 2 * .pi
        default:
            return arctan + .pi
        }
    }
    
}


