//
//  TowersViewController.swift
//  puzzlinator
//
//  Created by Quinten Hutchison on 4/22/18.
//  Copyright © 2018 EECS 392. All rights reserved.
//

import Foundation
import UIKit

class TowersViewController : UIViewController {
    
    //create references to the crazy amount of buttons
    @IBOutlet weak var b00: TowersCell!
    @IBOutlet weak var b01: TowersCell!
    @IBOutlet weak var b02: TowersCell!
    @IBOutlet weak var b03: TowersCell!
    @IBOutlet weak var b04: TowersCell!
    
    @IBOutlet weak var b10: TowersCell!
    @IBOutlet weak var b11: TowersCell!
    @IBOutlet weak var b12: TowersCell!
    @IBOutlet weak var b13: TowersCell!
    @IBOutlet weak var b14: TowersCell!
    
    @IBOutlet weak var b20: TowersCell!
    @IBOutlet weak var b21: TowersCell!
    @IBOutlet weak var b22: TowersCell!
    @IBOutlet weak var b23: TowersCell!
    @IBOutlet weak var b24: TowersCell!
    
    @IBOutlet weak var b30: TowersCell!
    @IBOutlet weak var b31: TowersCell!
    @IBOutlet weak var b32: TowersCell!
    @IBOutlet weak var b33: TowersCell!
    @IBOutlet weak var b34: TowersCell!
    
    @IBOutlet weak var b40: TowersCell!
    @IBOutlet weak var b41: TowersCell!
    @IBOutlet weak var b42: TowersCell!
    @IBOutlet weak var b43: TowersCell!
    @IBOutlet weak var b44: TowersCell!
    
    @IBOutlet weak var lr00: UILabel!
    @IBOutlet weak var lr01: UILabel!
    
    @IBOutlet weak var lr10: UILabel!
    @IBOutlet weak var lr11: UILabel!
    
    @IBOutlet weak var lr20: UILabel!
    @IBOutlet weak var lr21: UILabel!
    
    @IBOutlet weak var lr30: UILabel!
    @IBOutlet weak var lr31: UILabel!
    
    @IBOutlet weak var lr40: UILabel!
    @IBOutlet weak var lr41: UILabel!
    
    @IBOutlet weak var lc00: UILabel!
    @IBOutlet weak var lc01: UILabel!
    
    @IBOutlet weak var lc10: UILabel!
    @IBOutlet weak var lc11: UILabel!
    
    @IBOutlet weak var lc20: UILabel!
    @IBOutlet weak var lc21: UILabel!
    
    @IBOutlet weak var lc30: UILabel!
    @IBOutlet weak var lc31: UILabel!
    
    @IBOutlet weak var lc40: UILabel!
    @IBOutlet weak var lc41: UILabel!
    
    @IBAction func newGameButton(_ sender: Any) {
        gameInstance!.newGame()
    }
    
    @IBAction func setCurCell(_ sender: TowersCell) {
        if let oldCell = gameInstance!.curCell {
            oldCell.layer.borderWidth = 0
            oldCell.layer.borderColor = UIColor.clear.cgColor
        }
        gameInstance!.curCell = sender
        sender.layer.borderWidth = 1
        sender.layer.borderColor = UIColor.cyan.cgColor
    }
    
    @IBAction func setValue(_ sender: UIButton) {
        if let cell = gameInstance!.curCell {
            cell.setValue(Int(sender.titleLabel!.text!)!);
            cell.layer.borderWidth = 0
            cell.layer.borderColor = UIColor.clear.cgColor
            gameInstance!.curCell = nil
        }
    }
    
    var gameInstance : TowersGame?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let r1 = TowersCellGroup([b00, b01, b02, b03, b04], lr00, lr01)
        let r2 = TowersCellGroup([b10, b11, b12, b13, b14], lr10, lr11)
        let r3 = TowersCellGroup([b20, b21, b22, b23, b24], lr20, lr21)
        let r4 = TowersCellGroup([b30, b31, b32, b33, b34], lr30, lr31)
        let r5 = TowersCellGroup([b40, b41, b42, b43, b44], lr40, lr41)
        
        print("created rows")
        
        let c1 = TowersCellGroup([b00, b10, b20, b30, b40], lc00, lc01)
        let c2 = TowersCellGroup([b01, b11, b21, b31, b41], lc10, lc11)
        let c3 = TowersCellGroup([b02, b12, b22, b32, b42], lc20, lc21)
        let c4 = TowersCellGroup([b03, b13, b23, b33, b43], lc30, lc31)
        let c5 = TowersCellGroup([b04, b14, b24, b34, b44], lc40, lc41)
        
        print("created columns")
        
        let rows = [r1, r2 ,r3, r4, r5]
        let cols = [c1, c2, c3, c4, c5]
        
        gameInstance = TowersGame(rows: rows, cols: cols)
    
        print("created game instance")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
