//
//  GVCircularMenuButtonViewAppearance.swift
//  GVCircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

public struct GVCircularMenuButtonViewAppearance  {

    public var angle:CGFloat
    public var backgroundColor:UIColor
    public var strokeColor:UIColor
    public var fillColor:UIColor
    
    init(properties:[String:Any]){
        angle = properties[kCircularMenuButtonAngle] as! CGFloat
        backgroundColor = (properties[kCircularMenuButtonBackgroundColor] as? UIColor) ?? .white
        strokeColor = (properties[kCircularMenuButtonStrokeColor] as? UIColor) ?? .white
        fillColor = (properties[kCircularMenuButtonFillColor] as? UIColor) ?? .white
    }

}
