//
//  GVCircularMenuExternalCircle+ViewSetup.swift
//  GVCircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

extension GVCircularMenuExternalCircle {
    
    func viewSetup() {
        selfSetup()
    }
    
    func selfSetup(){
        layer.cornerRadius = frame.width / 2
    }
    
}
