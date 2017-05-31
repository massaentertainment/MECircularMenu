//
//  CircularMenuView.swift
//  GVCircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

public class CircularMenuView: UIView {
    
    //MARK: - Properties
    weak var delegate:CircularMenuDelegate?
    var dataSource:CircularMenuDataSource
    
    var centerCircle:UIView!
    var centerCircleIcon:UIImageView!
    var externalCircle:CircularMenuExternalCircle!
    
    private(set) var activeButtonIndex:Int = 0
    var lastTouchPoint:CGPoint = CGPoint.zero
    var rotationAngle:CGFloat = 0.0
    
    var isOpened:Bool {
        return externalCircle.isOpen
    }

    //MARK: - Constructors
    public init(frame: CGRect, dataSource: CircularMenuDataSource) {
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

}
