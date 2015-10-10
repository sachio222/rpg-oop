//
//  enemy.swift
//  rpgoop
//
//  Created by Jake Krajewski on 10/10/15.
//  Copyright © 2015 Jake Krajewski. All rights reserved.
//

import Foundation

class Enemy : Character {

    var loot: [String] {
        get{
            return ["Rusty Dagger", "Cracked Buckler", "Leather Armor"]
        }
    }
    
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        
        return nil
        
    }
    
    
}