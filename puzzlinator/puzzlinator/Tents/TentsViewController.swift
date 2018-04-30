//
//  TentsViewController.swift
//  puzzlinator
//
//  Created by Quinten Hutchison on 4/29/18.
//  Copyright © 2018 EECS 392. All rights reserved.
//

import Foundation
import UIKit

class TentsViewController : UIViewController {
    
    //create references to the crazy amount of buttons
    @IBOutlet weak var b00: TentsCell!
    @IBOutlet weak var b01: TentsCell!
    @IBOutlet weak var b02: TentsCell!
    @IBOutlet weak var b03: TentsCell!
    @IBOutlet weak var b04: TentsCell!
    
    @IBOutlet weak var b10: TentsCell!
    @IBOutlet weak var b11: TentsCell!
    @IBOutlet weak var b12: TentsCell!
    @IBOutlet weak var b13: TentsCell!
    @IBOutlet weak var b14: TentsCell!
    
    @IBOutlet weak var b20: TentsCell!
    @IBOutlet weak var b21: TentsCell!
    @IBOutlet weak var b22: TentsCell!
    @IBOutlet weak var b23: TentsCell!
    @IBOutlet weak var b24: TentsCell!
    
    @IBOutlet weak var b30: TentsCell!
    @IBOutlet weak var b31: TentsCell!
    @IBOutlet weak var b32: TentsCell!
    @IBOutlet weak var b33: TentsCell!
    @IBOutlet weak var b34: TentsCell!
    
    @IBOutlet weak var b40: TentsCell!
    @IBOutlet weak var b41: TentsCell!
    @IBOutlet weak var b42: TentsCell!
    @IBOutlet weak var b43: TentsCell!
    @IBOutlet weak var b44: TentsCell!
    
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
    
    @IBAction func setCurCell(_ sender: TentsCell) {
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
            //cell.setValue(Int(sender.titleLabel!.text!)!);
            cell.layer.borderWidth = 0
            cell.layer.borderColor = UIColor.clear.cgColor
            gameInstance!.curCell = nil
        }
    }
    
    var gameInstance : TentsGame?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let r1 = TentsCellGroup([b00, b01, b02, b03, b04], lr00, lr01)
        let r2 = TentsCellGroup([b10, b11, b12, b13, b14], lr10, lr11)
        let r3 = TentsCellGroup([b20, b21, b22, b23, b24], lr20, lr21)
        let r4 = TentsCellGroup([b30, b31, b32, b33, b34], lr30, lr31)
        let r5 = TentsCellGroup([b40, b41, b42, b43, b44], lr40, lr41)
        
        print("created rows")
        
        let c1 = TentsCellGroup([b00, b10, b20, b30, b40], lc00, lc01)
        let c2 = TentsCellGroup([b01, b11, b21, b31, b41], lc10, lc11)
        let c3 = TentsCellGroup([b02, b12, b22, b32, b42], lc20, lc21)
        let c4 = TentsCellGroup([b03, b13, b23, b33, b43], lc30, lc31)
        let c5 = TentsCellGroup([b04, b14, b24, b34, b44], lc40, lc41)
        
        print("created columns")
        
        let rows = [r1, r2 ,r3, r4, r5]
        let cols = [c1, c2, c3, c4, c5]
        
        gameInstance = TentsGame(rows: rows, cols: cols)
        
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

