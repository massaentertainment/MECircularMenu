//
//  GVCircularMenuDataSource.swift
//  GVCircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

public protocol GVCircularMenuDataSource {
    func numberOfButtons(in circularMenu:GVCircularMenuView) -> Int
    func proportionForCenterCircle(in circularMenu:GVCircularMenuView) -> CGFloat
    func circularMenu(_ circularMenu:GVCircularMenuView, activeImageForButtonIndex index:Int) -> UIImage
    func circularMenu(_ circularMenu:GVCircularMenuView, inactiveImageForButtonIndex index:Int) -> UIImage
    func circularMenu(_ circularMenu:GVCircularMenuView, propertiesForButtonIndex index:Int) -> [String:Any]
}
