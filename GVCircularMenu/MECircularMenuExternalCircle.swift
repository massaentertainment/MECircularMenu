//
//  MECircularMenuExternalCircle.swift
//  MECircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

public class MECircularMenuExternalCircle : UIView {
    
    //MARK: - Properties
    public var isOpen:Bool = true
    public var dataSource:MECircularMenuDataSource
    public var buttons:[MECircularMenuButtonView] = []
    public var circularMenu:MECircularMenuView
    
    //MARK: - Constructors
    public init(frame: CGRect, dataSource:MECircularMenuDataSource, parent: MECircularMenuView) {
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
        let numberOfButtons = dataSource.numberOfButtons?(in: circularMenu) ?? 1
        
        guard numberOfButtons > 0 else {
            fatalError("The numberOfButtons must be greater than or equals 1.")
        }
        
        //creating buttons
        for i in 0..<numberOfButtons {
            let angle = CGFloat((2.0 * Double.pi) / Double(numberOfButtons))
            let rotationAngle = CGFloat(i) * angle
            
            var properties = dataSource.circularMenu?(circularMenu, propertiesForButtonIndex: i) ?? [:]
            properties[kCircularMenuButtonAngle] = angle
            
            let button = MECircularMenuButtonView(frame: CGRect(origin: CGPoint.zero, size: frame.size), properties: properties)
            
            button.transform = CGAffineTransform(rotationAngle: rotationAngle)
            button.iconView.image = dataSource.circularMenu?(circularMenu, inactiveImageForButtonIndex: i)
            buttons.append(button)
            addSubview(button)
        }
    }
    
    func createSeparators() {
        let numberOfButtons = dataSource.numberOfButtons?(in: circularMenu) ?? 1
        
        for i in 0..<numberOfButtons {
            let rotationAngle = CGFloat(i) * CGFloat((2.0 * Double.pi) / Double(numberOfButtons))
            let rect = CGRect(x: 0, y: frame.size.height / 2 - 0.5, width: frame.size.width, height: 2)
            let separator = UIView(frame: rect)
            separator.layer.cornerRadius = 1
            let gradient = CAGradientLayer()
            gradient.frame = CGRect(x: rect.width / 2 + rect.width / 5, y: 0, width: 3 * rect.width / 10, height: 1)
            gradient.cornerRadius = separator.layer.cornerRadius
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
            
            gradient.colors = [
                UIColor(colorLiteralRed: 0.8392, green: 0.8431, blue: 0.8471, alpha: 1.0).cgColor,
                UIColor(colorLiteralRed: 0.8392, green: 0.8431, blue: 0.8471, alpha: 0.0).cgColor
            ]
            
            
            separator.transform = CGAffineTransform(rotationAngle: rotationAngle)
            
            separator.layer.addSublayer(gradient)
            addSubview(separator)
        }
    }
    
    public func setOpen(_ opened:Bool, animated:Bool = true){
        if opened {
            animateOpening()
        } else {
            animateClosing()
        }
        
        isOpen = opened
    }
    
    func createAnimation(keyPath:String,
                         fromValue:CGFloat,
                         toValue:CGFloat,
                         duration:Double = 0.35,
                         timingFunction:String = kCAMediaTimingFunctionEaseIn,
                         fillMode: String = kCAFillModeForwards, removedOnCompletion:Bool = false,
                         delegate:CAAnimationDelegate? = nil) -> CABasicAnimation {
        
        let animation = CABasicAnimation(keyPath: keyPath)
        
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.timingFunction = CAMediaTimingFunction(name: timingFunction)
        animation.fillMode = fillMode
        animation.duration = duration
        animation.isRemovedOnCompletion = removedOnCompletion
        animation.delegate = delegate
        
        return animation
    }
    
    fileprivate func animateOpening(animated:Bool = true) {
        let animation = createAnimation(keyPath: "transform.scale", fromValue: 0.0001, toValue: 1.0, duration: animated ? 0.35 : 0.001)
        self.layer.removeAllAnimations()
        self.layer.add(animation, forKey: "scaleUp")
    }
    
    fileprivate func animateClosing(animated:Bool = true) {
        let animation = createAnimation(keyPath: "transform.scale", fromValue: 1.0, toValue: 0.0001, duration: animated ? 0.35 : 0.001)
        self.layer.removeAllAnimations()
        self.layer.add(animation, forKey: "scaleDown")
    }
    
}
