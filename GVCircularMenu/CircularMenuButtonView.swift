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
    
    var properties:CircularMenuButtonViewAppearance
    
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
        
    }
    
}
