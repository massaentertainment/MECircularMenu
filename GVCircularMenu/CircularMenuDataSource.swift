//
//  CircularMenuDataSource.swift
//  GVCircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

public protocol CircularMenuDataSource {
    func numberOfButtons(in circularMenu:CircularMenuView) -> Int
    func circularMenu(_ circularMenu:CircularMenuView, activeImageForButtonIndex index:Int) -> UIImage
    func circularMenu(_ circularMenu:CircularMenuView, inactiveImageForButtonIndex index:Int) -> UIImage
}
