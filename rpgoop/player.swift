//
//  player.swift
//  rpgoop
//
//  Created by Jake Krajewski on 10/10/15.
//  Copyright © 2015 Jake Krajewski. All rights reserved.
//

import Foundation

class Player : Character {
    private var _name = "Player"
    
    // computer property. why? We're not going manipulate important data directly, we're going to make sure our class takes care of that. Protection, keeps us safe.
    var name: String {
        get {
            return _name
        }
    }
    
    private var _inventory = [String]()
    
    var inventory: [String] {
        get {
            return _inventory
        }
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int){
        self.init(startingHP: hp, attackPwr: attackPwr)
        
        _name = name
    }
}