//
//  ViewController.swift
//  CircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit
import MECircularMenu

class ViewController: UIViewController {
    
    let activeImages = [
        #imageLiteral(resourceName: "active_0"),
        #imageLiteral(resourceName: "active_1"),
        #imageLiteral(resourceName: "active_2"),
        #imageLiteral(resourceName: "active_3"),
        #imageLiteral(resourceName: "active_0"),
        #imageLiteral(resourceName: "active_1"),
        #imageLiteral(resourceName: "active_2")
    ]
    
    let inactiveImages = [
        #imageLiteral(resourceName: "inactive_0"),
        #imageLiteral(resourceName: "inactive_1"),
        #imageLiteral(resourceName: "inactive_2"),
        #imageLiteral(resourceName: "inactive_3"),
        #imageLiteral(resourceName: "inactive_0"),
        #imageLiteral(resourceName: "inactive_1"),
        #imageLiteral(resourceName: "inactive_2")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        let circMenu = MECircularMenuView(frame: CGRect(x: 50, y: 50, width: 140, height: 140), dataSource: self)
        circMenu.delegate = self
        circMenu.centerCircle.backgroundColor = UIColor(colorLiteralRed: 0.5412, green: 0.8706, blue: 0.6824, alpha: 1.0)
        view.addSubview(circMenu)
    }

    
}

extension ViewController : MECircularMenuDataSource, MECircularMenuDelegate {
    
    func numberOfButtons(in circularMenu:MECircularMenuView) -> Int {
        return 7
    }
    
    func proportionForCenterCircle(in circularMenu:MECircularMenuView) -> CGFloat {
        return 1/3.5
    }
    
    func circularMenu(_ circularMenu:MECircularMenuView, activeImageForButtonIndex index:Int) -> UIImage? {
        return activeImages[index]
    }
    
    func circularMenu(_ circularMenu:MECircularMenuView, inactiveImageForButtonIndex index:Int) -> UIImage? {
        return inactiveImages[index]
    }
    
    func circularMenu(_ circularMenu: MECircularMenuView, didSelectedButtonAt index: Int) {
        print("Did select \(index)")
    }
    
    func closedImageForCenterCircle(in circularMenu:MECircularMenuView) -> UIImage? {
        return nil
    }
    
    func openedImageForCenterCircle(in circularMenu:MECircularMenuView) -> UIImage? {
        return #imageLiteral(resourceName: "opened_icon")
    }
    
    func circularMenu(_ circularMenu:MECircularMenuView, propertiesForButtonIndex index:Int) -> [String:Any] {
        return [kCircularMenuButtonFillColor: UIColor.white,
                kCircularMenuButtonStrokeColor: UIColor.white]
    }
    
    func circularMenuDidOpen(_ circularMenu: MECircularMenuView){
        print("Did open")
    }
    
    func circularMenuWillOpen(_ circularMenu: MECircularMenuView) {
        print("Will open")
    }
    
    func circularMenuDidClose(_ circularMenu: MECircularMenuView) {
        print("Did close")
    }
    
    func circularMenuWillClose(_ circularMenu: MECircularMenuView) {
        print("Will close")
    }
    
}



