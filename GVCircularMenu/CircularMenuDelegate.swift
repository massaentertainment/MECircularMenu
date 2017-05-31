//
//  CircularMenuDelegate.swift
//  GVCircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

public protocol CircularMenuDelegate : class {
    func circularMenu(_ circularMenu:CircularMenuView, didSelectedButtonAt index:Int)
    func circularMenuDidOpen(_ circularMenu:CircularMenuView)
    func circularMenuWillOpen(_ circularMenu:CircularMenuView)
    func circularMenuDidClose(_ circularMenu:CircularMenuView)
    func circularMenuWillClose(_ circularMenu:CircularMenuView)
}
