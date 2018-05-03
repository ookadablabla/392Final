//
//  TentsGameController.swift
//  puzzlinator
//
//  Created by Quinten Hutchison on 4/29/18.
//  Copyright © 2018 EECS 392. All rights reserved.
//

import Foundation
import UIKit

class TentsGame {
    
    var numTents : Int = 5;
    
    private var rows : [TentsCellGroup]
    private var cols : [TentsCellGroup]
    private var soln : [[Int]] = [[], [], [], [], []]
    var curCell : TentsCell?
    
    init(rows : [TentsCellGroup], cols : [TentsCellGroup]) {
        self.rows = rows
        self.cols = cols
        newGame();
    }
    
    private func transpose<T>(_ vals : [T]) -> [T]{
        var ret = vals
        ret.swapAt(1, 5)
        ret.swapAt(2, 10)
        ret.swapAt(3, 15)
        ret.swapAt(4, 20)
        ret.swapAt(7, 11)
        ret.swapAt(8, 16)
        ret.swapAt(9, 21)
        ret.swapAt(13, 17)
        ret.swapAt(14, 22)
        ret.swapAt(19, 23)
        return ret
    }
    
    private func rotate<T>(_ a : [T]) -> [T] {
        return [a[20], a[15], a[10], a[5], a[0],
                a[21], a[16], a[11], a[6], a[1],
                a[22], a[17], a[12], a[7], a[2],
                a[23], a[18], a[13], a[8], a[3],
                a[24], a[19], a[14], a[9], a[4]]
    }
    
    let seeds = [
        "abccaccccbababcccccbcccca",
    ]
    
    func newGame() {
        var rand = Int(arc4random_uniform(UInt32(seeds.count)))
        let seed = seeds[rand]
        
        let dict : [Character:TentsCell.tileType] = [
            "a" : .tent,
            "b" : .tree,
            "c" : .blank
        ]
        
        var tiles : [TentsCell.tileType] = []
        for char in seed {
            tiles.append(dict[char]!)
        }
        
        rand = Int(arc4random_uniform(UInt32(4)))
        for _ in 0...rand {
            tiles = rotate(tiles)
        }
        
        let r1 = Array(tiles[0..<5])
        let r2 = Array(tiles[5..<10])
        let r3 = Array(tiles[10..<15])
        let r4 = Array(tiles[15..<20])
        let r5 = Array(tiles[20..<25])
        let rows = [r1, r2, r3, r4, r5]
        
        tiles = transpose(tiles)
        let c1 = Array(tiles[0..<5])
        let c2 = Array(tiles[5..<10])
        let c3 = Array(tiles[10..<15])
        let c4 = Array(tiles[15..<20])
        let c5 = Array(tiles[20..<25])
        let cols = [c1, c2, c3, c4, c5]
        
        for i in 0..<5 {
            self.rows[i].newGame(rows[i])
            self.cols[i].newGame(cols[i])
        }
    }
    
    func checkSolution() {
        for i in 0..<5 {
            self.rows[i].checkSolution()
            self.cols[i].checkSolution()
        }
    }
    
}

class TentsCellGroup {
    
    private var cells : [TentsCell]
    private var correct : [TentsCell.tileType]
    
    private var label1 : UILabel
    private var label2 : UILabel
    
    init(_ cells : [TentsCell], _ label1 : UILabel, _ label2 : UILabel) {
        self.cells = cells
        self.correct = []
        self.label1 = label1
        self.label2 = label2
    }
    
    func newGame(_ correct : [TentsCell.tileType], debug : Bool = false) {
        self.correct = correct
        
        //setup hint 1
        var hint = 0;
        loop: for val in correct {
            s: switch(val) {
                
            case .blank:
                break s
            case .grass:
                break s
            case .wrong:
                break s
            case .tree:
                break loop
            case .tent:
                hint = hint + 1
            }
            
        }
        label1.text! = String(describing : hint)
        
        //setup hint 2
        hint = 0;
        loop: for val in correct.reversed() {
            s: switch(val) {
                
            case .blank:
                break s
            case .grass:
                break s
            case .wrong:
                break s
            case .tree:
                break loop
            case .tent:
                hint = hint + 1
            }
            
        }
        label2.text! = String(describing : hint)
        
        //setup button labels now
        for (index, cell) in cells.enumerated() {
            if(debug) {
                cell.setType(correct[index])
            } else if(correct[index] == TentsCell.tileType.tree) {
                cell.setType(TentsCell.tileType.tree)
            } else {
                cell.setType(TentsCell.tileType.blank)
            }
        }
        
    }
    
    func checkSolution() {
        for (index, cell) in cells.enumerated() {
            if(cell.getType() == .tent && cell.getType() != correct[index]) {
                cell.setType(.wrong)
            }
        }
    }
    
    func count() -> Int {
        return cells.count
    }
    
    func get(_ index : Int) -> TentsCell{
        return cells[index]
    }
    
    func isValid() -> Bool {
        for (index, cell) in cells.enumerated() {
            if(cell.getType() != correct[index]) {
                return false
            }
        }
        return true
    }
}

class TentsCell : UIButton {
    
    private var type : tileType = .blank
    
    enum tileType {
        case blank
        case grass
        case tree
        case tent
        case wrong
    }
    
    func getType() -> tileType {
        return type
    }
    
    func setType(_ value : tileType) {
        self.type = value
        
        switch(self.type) {
        case .blank:
            self.setTitle("", for: .normal)
            self.backgroundColor = UIColor(white: 0.83, alpha: 1)
        case .grass:
            self.setTitle("", for: .normal)
            self.backgroundColor = UIColor.green
        case .tree:
            self.setTitle("", for: .normal)
            self.backgroundColor = UIColor.brown
        case .tent:
            self.setTitle("T", for: .normal)
            self.backgroundColor = UIColor.green
        case .wrong:
            self.setTitle("T", for: .normal)
            self.backgroundColor = UIColor.red
        }
        
        
    }
    
}
