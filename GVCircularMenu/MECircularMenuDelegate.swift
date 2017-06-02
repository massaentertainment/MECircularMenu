//
//  MECircularMenuDelegate.swift
//  MECircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

@objc public protocol MECircularMenuDelegate : class {
    @objc optional func circularMenu(_ circularMenu:MECircularMenuView, didSelectedButtonAt index:Int)
    @objc optional func circularMenuDidOpen(_ circularMenu:MECircularMenuView)
    @objc optional func circularMenuWillOpen(_ circularMenu:MECircularMenuView)
    @objc optional func circularMenuDidClose(_ circularMenu:MECircularMenuView)
    @objc optional func circularMenuWillClose(_ circularMenu:MECircularMenuView)
}
