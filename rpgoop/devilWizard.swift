//
//  devilWizard.swift
//  rpgoop
//
//  Created by Jake Krajewski on 10/10/15.
//  Copyright © 2015 Jake Krajewski. All rights reserved.
//

import Foundation

class DevilWizard : Enemy {
    override var loot: [String] {
        return ["Magic wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
}