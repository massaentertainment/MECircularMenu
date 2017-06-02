//
//  MECircularMenuDataSource.swift
//  MECircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

@objc public protocol MECircularMenuDataSource {
    @objc optional func numberOfButtons(in circularMenu:MECircularMenuView) -> Int
    @objc optional func proportionForCenterCircle(in circularMenu:MECircularMenuView) -> CGFloat
    @objc optional func closedImageForCenterCircle(in circularMenu:MECircularMenuView) -> UIImage?
    @objc optional func openedImageForCenterCircle(in circularMenu:MECircularMenuView) -> UIImage?
    @objc optional func circularMenu(_ circularMenu:MECircularMenuView, activeImageForButtonIndex index:Int) -> UIImage?
    @objc optional func circularMenu(_ circularMenu:MECircularMenuView, inactiveImageForButtonIndex index:Int) -> UIImage?
    @objc optional func circularMenu(_ circularMenu:MECircularMenuView, propertiesForButtonIndex index:Int) -> [String:Any]
}
