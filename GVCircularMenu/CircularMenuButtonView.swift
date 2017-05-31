//
//  CircularMenuButtonView.swift
//  GVCircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

class CircularMenuButtonView: UIView {

    //MARK: - Properties
    fileprivate var iconView:UIImageView!
    fileprivate var shapeLayer:CAShapeLayer!
    
    let properties:CircularMenuButtonViewAppearance
    
    //MARK: - Constructors
    public init(frame: CGRect, properties:[String:Any]) {
        self.properties = CircularMenuButtonViewAppearance(properties: properties)
        
        super.init(frame: frame)
    }
    
    override init(frame: CGRect) {
        fatalError("Incorrect constructor (init(frame:)). Must use init(frame:angle:).")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Incorrect constructor (init(coder:)). Must use init(frame:angle:).")
    }

}

extension CircularMenuButtonView {
    
    fileprivate func createShape(){
        let radius = frame.width / 2 //half the width so it can be circular.
        
        let path = CGMutablePath()
        
        path.move(to: .zero) //starting point
        //the - 2.0 is to prevent the stroke to being "cut" when rendering
        path.addArc(center: path.currentPoint, radius: radius - 2.0, startAngle: 0, endAngle: properties.angle, clockwise: false)
        path.addLine(to: .zero) //ending point
        
        shapeLayer = CAShapeLayer()
        
        //the following line converts the path boundingbox (its the smaller cgrect where the path can fit) to the view (self) coordinates space.
        shapeLayer.frame = self.convert(path.boundingBox, to: self)
        //sets the position to the midpoint between the two.
        shapeLayer.position = CGPoint(x: (layer.frame.size.width + shapeLayer.frame.size.width) / 2,
                                      y: (layer.frame.size.height + shapeLayer.frame.size.height) / 2)
        shapeLayer.path = path.copy() //the shapelayer now have the non-mutable copy of the previous created path
        
        //setting the colors
        shapeLayer.strokeColor = properties.strokeColor.cgColor
        shapeLayer.fillColor = properties.fillColor.cgColor
        
        //adds the shapelayer to the views layer.
        layer.addSublayer(shapeLayer)
    }
    
}
