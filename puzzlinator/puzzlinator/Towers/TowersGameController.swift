//
//  TowersButton.swift
//  puzzlinator
//
//  Created by Quinten Hutchison on 4/22/18.
//  Copyright © 2018 EECS 392. All rights reserved.
//

import Foundation
import UIKit

class TowersGame {
    
    private var rows : [TowersCellGroup]
    private var cols : [TowersCellGroup]
    private var soln : [[Int]] = [[], [], [], [], []]
    var curCell : TowersCell?
    
    init(rows : [TowersCellGroup], cols : [TowersCellGroup]) {
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
    
    let seeds = ["bcedaaedcbcdbaedbaeceacbd",
                 "cdbeaaedbcecadbdbcaebaecd",
                 "bdacecabeddecbaecdababedc"
                ]
    
    func newGame() {
        var rand = Int(arc4random_uniform(UInt32(seeds.count)))
        let seed = seeds[rand]
        
        
        var swapVals = ["a", "b", "c", "d", "e"]
        var shuffled = [String]()
        
        for _ in 0..<swapVals.count {
            rand = Int(arc4random_uniform(UInt32(swapVals.count)))
            shuffled.append(swapVals[rand])
            swapVals.remove(at: rand)
        }
        
        let dict : [Character:Int] = [
            "a" : shuffled.index(of: "a")! + 1,
            "b" : shuffled.index(of: "b")! + 1,
            "c" : shuffled.index(of: "c")! + 1,
            "d" : shuffled.index(of: "d")! + 1,
            "e" : shuffled.index(of: "e")! + 1,
        ]
        
        var nums : [Int] = []
        for char in seed {
            nums.append(dict[char]!)
        }
        
        rand = Int(arc4random_uniform(UInt32(swapVals.count)))
        for _ in 0...rand {
            nums = rotate(nums)
        }
        
        let r1 = Array(nums[0..<5])
        let r2 = Array(nums[5..<10])
        let r3 = Array(nums[10..<15])
        let r4 = Array(nums[15..<20])
        let r5 = Array(nums[20..<25])
        let rows = [r1, r2, r3, r4, r5]
        
        nums = transpose(nums)
        let c1 = Array(nums[0..<5])
        let c2 = Array(nums[5..<10])
        let c3 = Array(nums[10..<15])
        let c4 = Array(nums[15..<20])
        let c5 = Array(nums[20..<25])
        let cols = [c1, c2, c3, c4, c5]
        
        for i in 0..<5 {
            self.rows[i].newGame(rows[i])
            self.cols[i].newGame(cols[i])
        }
    }
    
}

class TowersCell : UIButton {
    
    private var value : Int?
    
    func getValue() -> Int? {
        return value
    }
    
    func setValue(_ value : Int) {
        self.value = value
        self.setTitle(String(describing:value), for: .normal)
    }
    
}

class TowersCellGroup {
    
    private var cells : [TowersCell]
    private var correct : [Int]
    
    private var label1 : UILabel
    private var label2 : UILabel
    
    init(_ cells : [TowersCell], _ label1 : UILabel, _ label2 : UILabel) {
        self.cells = cells
        self.correct = []
        self.label1 = label1
        self.label2 = label2
    }
    
    func newGame(_ correct : [Int], debug : Bool = false) {
        self.correct = correct
        
        //setup hint 1
        var max = 0;
        var hint = 0;
        for val in correct {
            if(val > max) {
                max = val
                hint = hint + 1
            }
        }
        label1.text! = String(describing : hint)
        
        //setup hint 2
        max = 0;
        hint = 0;
        for val in correct.reversed() {
            if(val > max) {
                max = val
                hint = hint + 1
            }
        }
        label2.text! = String(describing : hint)
        
        //setup button labels now
        for (index, cell) in cells.enumerated() {
            if(debug) {
                cell.setTitle(String(describing:correct[index]), for: .normal)
            } else {
                cell.setTitle("", for: .normal)
            }
        }
       
    }
    
    func count() -> Int {
        return cells.count
    }
    
    func get(_ index : Int) -> TowersCell{
        return cells[index]
    }
    
    func isValid() -> Bool {
        for (index, cell) in cells.enumerated() {
            if(cell.getValue() != correct[index]) {
                return false
            }
        }
        return true
    }
}
