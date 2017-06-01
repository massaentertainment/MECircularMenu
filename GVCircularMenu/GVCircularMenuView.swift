//
//  GVCircularMenuView.swift
//  GVCircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

public class GVCircularMenuView: UIView {
    
    //MARK: - Properties
    public weak var delegate:GVCircularMenuDelegate?
    public var dataSource:GVCircularMenuDataSource
    
    public var centerCircle:UIView!
    public var centerCircleIcon:UIImageView!
    public var externalCircle:GVCircularMenuExternalCircle!
    
    public private(set) var activeButtonIndex:Int = 0
    var lastTouchPoint:CGPoint = CGPoint.zero
    var rotationAngle:CGFloat = 0.0
    
    public var isOpened:Bool {
        return externalCircle.isOpen
    }

    //MARK: - Constructors
    public init(frame: CGRect, dataSource: GVCircularMenuDataSource) {
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
        externalCircle.buttons[index].iconView.image = dataSource.circularMenu?(self, activeImageForButtonIndex: index)
        
        let baseAngle = CGFloat(Double.pi / Double(externalCircle.buttons.count))
        let newRotationAngle = -baseAngle * 2.0 * CGFloat(index) + baseAngle
        rotationAngle = newRotationAngle
        UIView.animate(withDuration: 0.35, animations: {
            self.externalCircle.transform = CGAffineTransform(rotationAngle: newRotationAngle)
        })
    }

}
