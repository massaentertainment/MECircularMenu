//
//  CircularMenuExternalCircle.swift
//  GVCircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

public class CircularMenuExternalCircle : UIView {
    
    var isOpen:Bool = true
    var dataSource:CircularMenuDataSource
    var buttons:[CircularMenuButtonView] = []
    var circularMenu:CircularMenuView
    
    public init(frame: CGRect, dataSource:CircularMenuDataSource, parent: CircularMenuView) {
        self.dataSource = dataSource
        self.circularMenu = parent
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
