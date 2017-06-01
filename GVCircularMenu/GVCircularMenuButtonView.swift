//
//  GVCircularMenuButtonView.swift
//  GVCircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

public class GVCircularMenuButtonView: UIView {

    //MARK: - Properties
    var iconView:UIImageView!
    fileprivate var shapeLayer:CAShapeLayer!
    
    public let properties:GVCircularMenuButtonViewAppearance
    
    var radius:CGFloat {
        return frame.width / 2
    }
    
    //MARK: - Constructors
    public init(frame: CGRect, properties:[String:Any]) {
        self.properties = GVCircularMenuButtonViewAppearance(properties: properties)
        
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
        let pathPoint = CGPoint(x: location.x - shapeLayer.frame.origin.x, y: location.y - shapeLayer.frame.origin.y)
        return shapeLayer.path!.contains(pathPoint)
    }

}

extension GVCircularMenuButtonView {
    
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
        iconView.center = getIconCenterPoint(basePoint: shapeLayer.frame.origin)
        iconView.contentMode = .scaleAspectFit
        iconView.transform = CGAffineTransform(rotationAngle: .pi / 4)
        
        self.addSubview(iconView)
    }
    
    fileprivate func getIconCenterPoint(basePoint:CGPoint) -> CGPoint {
        let baseAngle = properties.angle / 2.0
        let path = CGMutablePath()
        path.move(to: .zero)
        path.addArc(center: path.currentPoint, radius: (radius - 2.0) / 1.5, startAngle: 0, endAngle: baseAngle, clockwise: false)
        return CGPoint(x: path.currentPoint.x + basePoint.x, y: path.currentPoint.y + basePoint.y)
        
        //return CGPoint(x: x, y: y)
    }
    
}
