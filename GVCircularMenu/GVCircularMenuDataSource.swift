//
//  GVCircularMenuDataSource.swift
//  GVCircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

@objc public protocol GVCircularMenuDataSource {
    @objc optional func numberOfButtons(in circularMenu:GVCircularMenuView) -> Int
    @objc optional func proportionForCenterCircle(in circularMenu:GVCircularMenuView) -> CGFloat
    @objc optional func closedImageForCenterCircle(in circularMenu:GVCircularMenuView) -> UIImage?
    @objc optional func openedImageForCenterCircle(in circularMenu:GVCircularMenuView) -> UIImage?
    @objc optional func circularMenu(_ circularMenu:GVCircularMenuView, activeImageForButtonIndex index:Int) -> UIImage?
    @objc optional func circularMenu(_ circularMenu:GVCircularMenuView, inactiveImageForButtonIndex index:Int) -> UIImage?
    @objc optional func circularMenu(_ circularMenu:GVCircularMenuView, propertiesForButtonIndex index:Int) -> [String:Any]
}
