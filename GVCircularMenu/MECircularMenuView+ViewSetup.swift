//
//  MECircularMenuView+ViewSetup.swift
//  MECircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

extension MECircularMenuView {
    
    func viewSetup(){
        createExternalCircle()
        createCenter()
        
        createTapRecognizer()
    }
    
    func createCenter(){
        let width = frame.width * (dataSource.proportionForCenterCircle?(in: self) ?? 1/3.5)
        centerCircle = UIView(frame: CGRect(x: (frame.width - width) / 2, y: (frame.height - width) / 2, width: width, height: width))
        //centerCircle.center = center
        centerCircle.layer.cornerRadius = width / 2 //sets it circular
        
        let iconSide = centerCircle.frame.width / 2
        centerCircleIcon = UIImageView(frame: CGRect(x: (centerCircle.frame.width - iconSide)/2, y: (centerCircle.frame.height - iconSide)/2, width: iconSide, height: iconSide))
        centerCircleIcon.contentMode = .scaleAspectFit
        centerCircleIcon.image = dataSource.openedImageForCenterCircle?(in: self)
        centerCircle.addSubview(centerCircleIcon)
        
        self.addSubview(centerCircle)
    }
    
    func createExternalCircle() {
        externalCircle = MECircularMenuExternalCircle(frame: CGRect(origin: .zero, size: frame.size), dataSource: dataSource, parent: self)
        
        rotationAngle += CGFloat(Double.pi / Double(externalCircle.buttons.count))
        externalCircle.transform = CGAffineTransform(rotationAngle: rotationAngle)
        externalCircle.buttons[activeButtonIndex].iconView.image = dataSource.circularMenu?(self, activeImageForButtonIndex: activeButtonIndex)
        
        self.addSubview(externalCircle)
    }
    
    func createTapRecognizer() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.onTap(_:)))
        recognizer.numberOfTapsRequired = 1
        recognizer.numberOfTouchesRequired = 1
        
        self.addGestureRecognizer(recognizer)
    }
}
