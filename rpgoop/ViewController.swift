//
//  ViewController.swift
//  rpgoop
//
//  Created by Jake Krajewski on 10/10/15.
//  Copyright © 2015 Jake Krajewski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLbl: UILabel!
    
    @IBOutlet weak var playerHpLbl: UILabel!
    
    @IBOutlet weak var enemyHpLbl: UILabel!
    
    @IBOutlet weak var enemyImg: UIImageView!
    
    @IBOutlet weak var chestButton: UIButton!
    
    @IBOutlet weak var attackBtn: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    
    // on variable creation, do we know there's gonna be a value in it? if not, then optional.
    var chestMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "DirtyHarry", hp:110, attackPwr: 20)
        playerHpLbl.text = "\(player.hp) HP"
        
        
        // generate a random enemy
        generateRandomEnemy()
    }
    
    func generateRandomEnemy(){
        
        // generating either a 1 or 0
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHP:50, attackPwr: 12)
        } else {
            enemy = DevilWizard(startingHP: 60, attackPwr: 15)
        }
        enemyImg.hidden = false
        enemyHpLbl.text = "\(enemy.hp) HP"
        printLbl.text = "You are now fighting a \(enemy.type)"
        attackBtn.enabled = true
        
    }
    
    @IBAction func onChestTapped(sender: AnyObject) {
        chestButton.hidden = true
        printLbl.text = chestMessage
        enemyHpLbl.text = "Huzzah!"
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
        
    }

    @IBAction func attackTapped(sender: AnyObject) {

        if enemy.attemptAttack(player.attackPwr) && enemy.isAlive {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP!"
            enemyHpLbl.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "Attack was unsuccessful!"
        }
        
        if !enemy.isAlive {
            printLbl.text = "You defeated the \(enemy.type)!"
            enemyImg.hidden = true
            dropLoot()
        }

    }
    
    func dropLoot() {
        
        if let loot = enemy.dropLoot() {
            
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)!"
            attackBtn.enabled = false
            chestButton.hidden = false
            enemyHpLbl.text = "Loot!"
            
        }
        
    }
    
// need a player and enemy class. Are there any traits among them that should be shared? Maybe into a parent class. Health? Attack Power?


}

