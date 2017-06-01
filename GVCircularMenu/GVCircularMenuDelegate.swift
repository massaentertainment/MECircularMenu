//
//  GVCircularMenuDelegate.swift
//  GVCircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

@objc public protocol GVCircularMenuDelegate : class {
    @objc optional func circularMenu(_ circularMenu:GVCircularMenuView, didSelectedButtonAt index:Int)
    @objc optional func circularMenuDidOpen(_ circularMenu:GVCircularMenuView)
    @objc optional func circularMenuWillOpen(_ circularMenu:GVCircularMenuView)
    @objc optional func circularMenuDidClose(_ circularMenu:GVCircularMenuView)
    @objc optional func circularMenuWillClose(_ circularMenu:GVCircularMenuView)
}
