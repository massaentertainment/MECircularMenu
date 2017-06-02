//
//  MECircularMenuExternalCircle+ViewSetup.swift
//  MECircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

extension MECircularMenuExternalCircle {
    
    func viewSetup() {
        selfSetup()
    }
    
    func selfSetup(){
        layer.cornerRadius = frame.width / 2
    }
    
}
