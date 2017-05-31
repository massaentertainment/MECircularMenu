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
    fileprivate var angle:CGFloat
    fileprivate var iconView:UIImageView!
    fileprivate var shapeLayer:CAShapeLayer!
    
    //MARK: - Constructors
    public init(frame: CGRect, angle: CGFloat) {
        self.angle = angle
        
        super.init(frame: frame)
    }
    
    override init(frame: CGRect) {
        fatalError("Incorrect constructor (init(frame:)). Must use init(frame:angle:).")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Incorrect constructor (init(coder:)). Must use init(frame:angle:).")
    }

}
