//
//  GVCircularMenuDelegate.swift
//  GVCircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

public protocol GVCircularMenuDelegate : class {
    func circularMenu(_ circularMenu:GVCircularMenuView, didSelectedButtonAt index:Int)
    func circularMenuDidOpen(_ circularMenu:GVCircularMenuView)
    func circularMenuWillOpen(_ circularMenu:GVCircularMenuView)
    func circularMenuDidClose(_ circularMenu:GVCircularMenuView)
    func circularMenuWillClose(_ circularMenu:GVCircularMenuView)
}
