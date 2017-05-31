//
//  CircularMenuButtonView.swift
//  GVCircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

public class CircularMenuButtonView: UIView {

    //MARK: - Properties
    var iconView:UIImageView!
    fileprivate var shapeLayer:CAShapeLayer!
    
    let properties:CircularMenuButtonViewAppearance
    
    var radius:CGFloat {
        return frame.width / 2
    }
    
    //MARK: - Constructors
    public init(frame: CGRect, properties:[String:Any]) {
        self.properties = CircularMenuButtonViewAppearance(properties: properties)
        
        super.init(frame: frame)
        
        createShape()
        createIcon()
    }
    
    override public init(frame: CGRect) {
        fatalError("Incorrect constructor (init(frame:)). Must use init(frame:angle:).")
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("Incorrect constructor (init(coder:)). Must use init(frame:angle:).")
    }
    
    public func touch(at location:CGPoint) -> Bool {
        return shapeLayer.frame.contains(location)
    }

}

extension CircularMenuButtonView {
    
    fileprivate func createShape(){
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
    
    fileprivate func createIcon(){
        let side = radius / 3
        let iconFrame = CGRect(x: 0, y: 0, width: side, height: side)
        
        iconView = UIImageView(frame: iconFrame)
        iconView.center = CGPoint(x: radius / 4 + shapeLayer.frame.origin.x, y: radius / 4 + shapeLayer.frame.origin.y)
        iconView.contentMode = .scaleAspectFit
        iconView.transform = CGAffineTransform(rotationAngle: .pi / 4)
        
        self.addSubview(iconView)
    }
    
    fileprivate func getIconCenterPoint(basePoint:CGPoint) -> CGPoint {
        //from the linear algebra, we rotate the point (as matrix) for half the angle of the properties
        let baseX = radius / 2 // the center the icon is on the middle of the radius
        let baseAngle = properties.angle / 2 // and in the middle of the arc
        
        let cosValue = cos(baseAngle)
        let sinValue = sin(baseAngle)
        
        let x = baseX * cosValue - basePoint.y * sinValue
        let y = baseX * sinValue + basePoint.y * cosValue
        
        return CGPoint(x: x, y: y)
    }
    
}
