//
//  CircularMenuExternalCircle.swift
//  GVCircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

public class CircularMenuExternalCircle : UIView {
    
    //MARK: - Properties
    var isOpen:Bool = true
    var dataSource:CircularMenuDataSource
    var buttons:[CircularMenuButtonView] = []
    var circularMenu:CircularMenuView
    
    //MARK: - Constructors
    public init(frame: CGRect, dataSource:CircularMenuDataSource, parent: CircularMenuView) {
        self.dataSource = dataSource
        self.circularMenu = parent
        super.init(frame: frame)
    }
    
    override public init(frame: CGRect) {
        fatalError("Incorrect constructor (init(frame:)). Must use init(frame:angle:).")
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("Incorrect constructor (init(coder:)). Must use init(frame:angle:).")
    }
    
}
