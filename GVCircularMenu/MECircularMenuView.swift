//
//  MECircularMenuView.swift
//  MECircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

public class MECircularMenuView: UIView {
    
    //MARK: - Properties
    public weak var delegate:MECircularMenuDelegate?
    public var dataSource:MECircularMenuDataSource
    
    public var centerCircle:UIView!
    public var centerCircleIcon:UIImageView!
    public var externalCircle:MECircularMenuExternalCircle!
    
    public private(set) var activeButtonIndex:Int = 0
    var lastTouchPoint:CGPoint = CGPoint.zero
    var rotationAngle:CGFloat = 0.0
    
    public var isOpened:Bool {
        return externalCircle.isOpen
    }

    //MARK: - Constructors
    public init(frame: CGRect, dataSource: MECircularMenuDataSource) {
        self.dataSource = dataSource
        super.init(frame: frame)
        
        viewSetup()
        
    }
    
    override public init(frame: CGRect) {
        fatalError("Incorrect constructor (init(frame:)). Must use init(frame:angle:).")
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("Incorrect constructor (init(coder:)). Must use init(frame:angle:).")
    }
    
    public func setActive(buttonIndex index:Int) {
        if index == activeButtonIndex {
            return
        }
        
        let previousIndex = activeButtonIndex
        activeButtonIndex = index
        delegate?.circularMenu?(self, didSelectedButtonAt: index)
        externalCircle.buttons[previousIndex].iconView.image = dataSource.circularMenu?(self, inactiveImageForButtonIndex: previousIndex)
        
        let activeButton = externalCircle.buttons[index]
        activeButton.iconView.image = dataSource.circularMenu?(self, activeImageForButtonIndex: index)
        
        let baseAngle = activeButton.properties.angle
        let indexAngle = baseAngle * CGFloat(index) + baseAngle / 2
        let newRotationAngle:CGFloat = .pi / 2 - indexAngle
        rotationAngle = newRotationAngle
        UIView.animate(withDuration: 0.35, animations: {
            self.externalCircle.transform = CGAffineTransform(rotationAngle: newRotationAngle)
        })
    }

}
