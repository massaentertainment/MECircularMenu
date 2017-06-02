//
//  GVCircularMenuView+TouchesEvents.swift
//  GVCircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

extension GVCircularMenuView {
    
    public func rotate(_ sender:Any?) {
        guard let recognizer = sender as? OneFingerRotationGestureRecognizer, recognizer.state != .ended else {
            return
        }
        
        let direction = recognizer.currentAngle - recognizer.previousAngle
        let prevTransform = externalCircle.transform
        externalCircle.transform = prevTransform.rotated(by: direction)
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        lastTouchPoint = location
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let sprview = superview else { return }
        
        let location = touch.location(in: self)
        let anglePerPoint = CGFloat(Double.pi) / (sprview.frame.size.width / 4)
        let deltaX = location.x - lastTouchPoint.x
        
        
        rotationAngle += atan2(location.x - frame.midX, location.y - frame.midY) * anglePerPoint //max(deltaX, deltaY) * anglePerPoint
        externalCircle.transform = CGAffineTransform(rotationAngle: rotationAngle)
        lastTouchPoint = location
        
//        let radToRotate = atan2(location.y - frame.midX, location.x - frame.midY)
//        externalCircle.transform = CGAffineTransform(rotationAngle: radToRotate)
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: self)
        if centerCircle.frame.contains(location){
            if isOpened {
                delegate?.circularMenuWillClose?(self)
                centerCircleIcon.image = dataSource.closedImageForCenterCircle?(in: self)
                externalCircle.setOpen(!isOpened)
                delegate?.circularMenuDidClose?(self)
            } else {
                delegate?.circularMenuWillOpen?(self)
                centerCircleIcon.image = dataSource.openedImageForCenterCircle?(in: self)
                externalCircle.setOpen(!isOpened)
                delegate?.circularMenuDidOpen?(self)
            }
        } else {
            guard isOpened else { return }
            
            for i in 0..<externalCircle.buttons.count {
                let button = externalCircle.buttons[i]
                let specificLocation = touch.location(in: button)
                if button.touch(at: specificLocation) {
                    setActive(buttonIndex: i)
                    break
                }
            }
        }
    }
    
}
