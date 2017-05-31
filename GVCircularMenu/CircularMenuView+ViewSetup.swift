//
//  CircularMenuView+ViewSetup.swift
//  GVCircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

extension CircularMenuView {
    
    func viewSetup(){
        createCenter()
        createExternalCircle()
    }
    
    func createCenter(){
        let width = frame.width / 3.5
        centerCircle = UIView(frame: CGRect(x: center.x - width / 2, y: center.y - width / 2, width: width, height: width))
        centerCircle.layer.cornerRadius = width / 2 //sets it circular
        
        let iconSide = centerCircle.frame.width / 2
        centerCircleIcon = UIImageView(frame: CGRect(x: iconSide/2, y: iconSide/2, width: iconSide, height: iconSide))
        centerCircleIcon.contentMode = .scaleAspectFit
        
        self.addSubview(centerCircle)
    }
    
    func createExternalCircle() {
        externalCircle = CircularMenuExternalCircle(frame: frame, dataSource: dataSource, parent: self)
        
        rotationAngle += CGFloat(Double.pi / Double(externalCircle.buttons.count))
        externalCircle.transform = CGAffineTransform(rotationAngle: rotationAngle)
        externalCircle.buttons[activeButtonIndex].iconView.image = dataSource.circularMenu(self, activeImageForButtonIndex: activeButtonIndex)
    }
}
