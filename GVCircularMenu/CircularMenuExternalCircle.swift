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
        
        viewSetup()
        
        createButtons()
        createSeparators()
    }
    
    override public init(frame: CGRect) {
        fatalError("Incorrect constructor (init(frame:)). Must use init(frame:angle:).")
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("Incorrect constructor (init(coder:)). Must use init(frame:angle:).")
    }
    
    func createButtons() {
        let numberOfButtons = dataSource.numberOfButtons(in: circularMenu)
        
        //creating buttons
        for i in 0..<numberOfButtons {
            let angle = CGFloat((2.0 * Double.pi) / Double(numberOfButtons))
            let rotationAngle = CGFloat(i) * angle
            let button = CircularMenuButtonView(frame: CGRect(origin: CGPoint.zero, size: frame.size), properties: [kCircularMenuButtonAngle: angle])
            
            button.transform = CGAffineTransform(rotationAngle: rotationAngle)
            button.iconView.image = dataSource.circularMenu(circularMenu, inactiveImageForButtonIndex: i)
            buttons.append(button)
            addSubview(button)
        }
    }
    
    func createSeparators() {
        
    }
    
}
