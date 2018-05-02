//
//  SudokuViewController.swift
//  puzzlinator
//
//  Created by Jacob Kessler on 4/23/18.
//  Copyright © 2018 EECS 392. All rights reserved.
//

import UIKit

class SudokuViewController: UIViewController
{

    var game : SudokuGame = SudokuGame()
    var unsolved : String = ""
    var solved : String = ""
    
    @IBOutlet weak var sqr00: UILabel!
    @IBOutlet weak var sqr01: UILabel!
    @IBOutlet weak var sqr02: UILabel!
    @IBOutlet weak var sqr03: UILabel!
    @IBOutlet weak var sqr04: UILabel!
    @IBOutlet weak var sqr05: UILabel!
    @IBOutlet weak var sqr06: UILabel!
    @IBOutlet weak var sqr07: UILabel!
    @IBOutlet weak var sqr08: UILabel!
    
    @IBOutlet weak var sqr10: UILabel!
    @IBOutlet weak var sqr11: UILabel!
    @IBOutlet weak var sqr12: UILabel!
    @IBOutlet weak var sqr13: UILabel!
    @IBOutlet weak var sqr14: UILabel!
    @IBOutlet weak var sqr15: UILabel!
    @IBOutlet weak var sqr16: UILabel!
    @IBOutlet weak var sqr17: UILabel!
    @IBOutlet weak var sqr18: UILabel!
    
    @IBOutlet weak var sqr20: UILabel!
    @IBOutlet weak var sqr21: UILabel!
    @IBOutlet weak var sqr22: UILabel!
    @IBOutlet weak var sqr23: UILabel!
    @IBOutlet weak var sqr24: UILabel!
    @IBOutlet weak var sqr25: UILabel!
    @IBOutlet weak var sqr26: UILabel!
    @IBOutlet weak var sqr27: UILabel!
    @IBOutlet weak var sqr28: UILabel!

    @IBOutlet weak var sqr30: UILabel!
    @IBOutlet weak var sqr31: UILabel!
    @IBOutlet weak var sqr32: UILabel!
    @IBOutlet weak var sqr33: UILabel!
    @IBOutlet weak var sqr34: UILabel!
    @IBOutlet weak var sqr35: UILabel!
    @IBOutlet weak var sqr36: UILabel!
    @IBOutlet weak var sqr37: UILabel!
    @IBOutlet weak var sqr38: UILabel!

    @IBOutlet weak var sqr40: UILabel!
    @IBOutlet weak var sqr41: UILabel!
    @IBOutlet weak var sqr42: UILabel!
    @IBOutlet weak var sqr43: UILabel!
    @IBOutlet weak var sqr44: UILabel!
    @IBOutlet weak var sqr45: UILabel!
    @IBOutlet weak var sqr46: UILabel!
    @IBOutlet weak var sqr47: UILabel!
    @IBOutlet weak var sqr48: UILabel!

    @IBOutlet weak var sqr50: UILabel!
    @IBOutlet weak var sqr51: UILabel!
    @IBOutlet weak var sqr52: UILabel!
    @IBOutlet weak var sqr53: UILabel!
    @IBOutlet weak var sqr54: UILabel!
    @IBOutlet weak var sqr55: UILabel!
    @IBOutlet weak var sqr56: UILabel!
    @IBOutlet weak var sqr57: UILabel!
    @IBOutlet weak var sqr58: UILabel!

    @IBOutlet weak var sqr60: UILabel!
    @IBOutlet weak var sqr61: UILabel!
    @IBOutlet weak var sqr62: UILabel!
    @IBOutlet weak var sqr63: UILabel!
    @IBOutlet weak var sqr64: UILabel!
    @IBOutlet weak var sqr65: UILabel!
    @IBOutlet weak var sqr66: UILabel!
    @IBOutlet weak var sqr67: UILabel!
    @IBOutlet weak var sqr68: UILabel!

    @IBOutlet weak var sqr70: UILabel!
    @IBOutlet weak var sqr71: UILabel!
    @IBOutlet weak var sqr72: UILabel!
    @IBOutlet weak var sqr73: UILabel!
    @IBOutlet weak var sqr74: UILabel!
    @IBOutlet weak var sqr75: UILabel!
    @IBOutlet weak var sqr76: UILabel!
    @IBOutlet weak var sqr77: UILabel!
    @IBOutlet weak var sqr78: UILabel!

    @IBOutlet weak var sqr80: UILabel!
    @IBOutlet weak var sqr81: UILabel!
    @IBOutlet weak var sqr82: UILabel!
    @IBOutlet weak var sqr83: UILabel!
    @IBOutlet weak var sqr84: UILabel!
    @IBOutlet weak var sqr85: UILabel!
    @IBOutlet weak var sqr86: UILabel!
    @IBOutlet weak var sqr87: UILabel!
    @IBOutlet weak var sqr88: UILabel!

    var allSquares : [UILabel]
    var selectedSquareIndex : Int
    var background : UIColor
    
    required init?(coder aDecoder: NSCoder) {
        self.selectedSquareIndex = -1
        self.allSquares = [UILabel]()
        self.background = UIColor(red: 219/255, green: 219/255, blue: 219/255, alpha: 1)

        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allSquares.append(sqr00)
        allSquares.append(sqr01)
        allSquares.append(sqr02)
        allSquares.append(sqr03)
        allSquares.append(sqr04)
        allSquares.append(sqr05)
        allSquares.append(sqr06)
        allSquares.append(sqr07)
        allSquares.append(sqr08)
        
        allSquares.append(sqr10)
        allSquares.append(sqr11)
        allSquares.append(sqr12)
        allSquares.append(sqr13)
        allSquares.append(sqr14)
        allSquares.append(sqr15)
        allSquares.append(sqr16)
        allSquares.append(sqr17)
        allSquares.append(sqr18)

        allSquares.append(sqr20)
        allSquares.append(sqr21)
        allSquares.append(sqr22)
        allSquares.append(sqr23)
        allSquares.append(sqr24)
        allSquares.append(sqr25)
        allSquares.append(sqr26)
        allSquares.append(sqr27)
        allSquares.append(sqr28)

        allSquares.append(sqr30)
        allSquares.append(sqr31)
        allSquares.append(sqr32)
        allSquares.append(sqr33)
        allSquares.append(sqr34)
        allSquares.append(sqr35)
        allSquares.append(sqr36)
        allSquares.append(sqr37)
        allSquares.append(sqr38)

        allSquares.append(sqr40)
        allSquares.append(sqr41)
        allSquares.append(sqr42)
        allSquares.append(sqr43)
        allSquares.append(sqr44)
        allSquares.append(sqr45)
        allSquares.append(sqr46)
        allSquares.append(sqr47)
        allSquares.append(sqr48)

        allSquares.append(sqr50)
        allSquares.append(sqr51)
        allSquares.append(sqr52)
        allSquares.append(sqr53)
        allSquares.append(sqr54)
        allSquares.append(sqr55)
        allSquares.append(sqr56)
        allSquares.append(sqr57)
        allSquares.append(sqr58)

        allSquares.append(sqr60)
        allSquares.append(sqr61)
        allSquares.append(sqr62)
        allSquares.append(sqr63)
        allSquares.append(sqr64)
        allSquares.append(sqr65)
        allSquares.append(sqr66)
        allSquares.append(sqr67)
        allSquares.append(sqr68)

        allSquares.append(sqr70)
        allSquares.append(sqr71)
        allSquares.append(sqr72)
        allSquares.append(sqr73)
        allSquares.append(sqr74)
        allSquares.append(sqr75)
        allSquares.append(sqr76)
        allSquares.append(sqr77)
        allSquares.append(sqr78)

        allSquares.append(sqr80)
        allSquares.append(sqr81)
        allSquares.append(sqr82)
        allSquares.append(sqr83)
        allSquares.append(sqr84)
        allSquares.append(sqr85)
        allSquares.append(sqr86)
        allSquares.append(sqr87)
        allSquares.append(sqr88)

        for sqr in allSquares
        {
            sqr.isUserInteractionEnabled = true
        }
        
        let tap00 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap01 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap02 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap03 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap04 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap05 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap06 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap07 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap08 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        
        let tap10 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap11 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap12 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap13 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap14 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap15 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap16 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap17 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap18 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))

        let tap20 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap21 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap22 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap23 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap24 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap25 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap26 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap27 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap28 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))

        let tap30 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap31 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap32 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap33 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap34 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap35 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap36 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap37 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap38 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))

        let tap40 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap41 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap42 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap43 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap44 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap45 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap46 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap47 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap48 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))

        let tap50 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap51 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap52 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap53 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap54 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap55 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap56 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap57 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap58 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))

        let tap60 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap61 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap62 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap63 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap64 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap65 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap66 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap67 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap68 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))

        let tap70 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap71 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap72 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap73 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap74 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap75 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap76 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap77 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap78 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))

        let tap80 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap81 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap82 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap83 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap84 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap85 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap86 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap87 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))
        let tap88 = UITapGestureRecognizer(target: self, action: #selector(SudokuViewController.onLabelClick))

        sqr00.tag = 0
        sqr01.tag = 1
        sqr02.tag = 2
        sqr03.tag = 3
        sqr04.tag = 4
        sqr05.tag = 5
        sqr06.tag = 6
        sqr07.tag = 7
        sqr08.tag = 8
        
        sqr10.tag = 9
        sqr11.tag = 10
        sqr12.tag = 11
        sqr13.tag = 12
        sqr14.tag = 13
        sqr15.tag = 14
        sqr16.tag = 15
        sqr17.tag = 16
        sqr18.tag = 17
        
        sqr20.tag = 18
        sqr21.tag = 19
        sqr22.tag = 20
        sqr23.tag = 21
        sqr24.tag = 22
        sqr25.tag = 23
        sqr26.tag = 24
        sqr27.tag = 25
        sqr28.tag = 26
        
        sqr30.tag = 27
        sqr31.tag = 28
        sqr32.tag = 29
        sqr33.tag = 30
        sqr34.tag = 31
        sqr35.tag = 32
        sqr36.tag = 33
        sqr37.tag = 34
        sqr38.tag = 35
        
        sqr40.tag = 36
        sqr41.tag = 37
        sqr42.tag = 38
        sqr43.tag = 39
        sqr44.tag = 40
        sqr45.tag = 41
        sqr46.tag = 42
        sqr47.tag = 43
        sqr48.tag = 44
        
        sqr50.tag = 45
        sqr51.tag = 46
        sqr52.tag = 47
        sqr53.tag = 48
        sqr54.tag = 49
        sqr55.tag = 50
        sqr56.tag = 51
        sqr57.tag = 52
        sqr58.tag = 53
    
        sqr60.tag = 54
        sqr61.tag = 55
        sqr62.tag = 56
        sqr63.tag = 57
        sqr64.tag = 58
        sqr65.tag = 59
        sqr66.tag = 60
        sqr67.tag = 61
        sqr68.tag = 62
        
        sqr70.tag = 63
        sqr71.tag = 64
        sqr72.tag = 65
        sqr73.tag = 66
        sqr74.tag = 67
        sqr75.tag = 68
        sqr76.tag = 69
        sqr77.tag = 70
        sqr78.tag = 71
        
        sqr80.tag = 72
        sqr81.tag = 73
        sqr82.tag = 74
        sqr83.tag = 75
        sqr84.tag = 76
        sqr85.tag = 77
        sqr86.tag = 78
        sqr87.tag = 79
        sqr88.tag = 80
        
        sqr00.addGestureRecognizer(tap00)
        sqr01.addGestureRecognizer(tap01)
        sqr02.addGestureRecognizer(tap02)
        sqr03.addGestureRecognizer(tap03)
        sqr04.addGestureRecognizer(tap04)
        sqr05.addGestureRecognizer(tap05)
        sqr06.addGestureRecognizer(tap06)
        sqr07.addGestureRecognizer(tap07)
        sqr08.addGestureRecognizer(tap08)
        
        sqr10.addGestureRecognizer(tap10)
        sqr11.addGestureRecognizer(tap11)
        sqr12.addGestureRecognizer(tap12)
        sqr13.addGestureRecognizer(tap13)
        sqr14.addGestureRecognizer(tap14)
        sqr15.addGestureRecognizer(tap15)
        sqr16.addGestureRecognizer(tap16)
        sqr17.addGestureRecognizer(tap17)
        sqr18.addGestureRecognizer(tap18)
    
        sqr20.addGestureRecognizer(tap20)
        sqr21.addGestureRecognizer(tap21)
        sqr22.addGestureRecognizer(tap22)
        sqr23.addGestureRecognizer(tap23)
        sqr24.addGestureRecognizer(tap24)
        sqr25.addGestureRecognizer(tap25)
        sqr26.addGestureRecognizer(tap26)
        sqr27.addGestureRecognizer(tap27)
        sqr28.addGestureRecognizer(tap28)
        
        sqr30.addGestureRecognizer(tap30)
        sqr31.addGestureRecognizer(tap31)
        sqr32.addGestureRecognizer(tap32)
        sqr33.addGestureRecognizer(tap33)
        sqr34.addGestureRecognizer(tap34)
        sqr35.addGestureRecognizer(tap35)
        sqr36.addGestureRecognizer(tap36)
        sqr37.addGestureRecognizer(tap37)
        sqr38.addGestureRecognizer(tap38)
        
        sqr40.addGestureRecognizer(tap40)
        sqr41.addGestureRecognizer(tap41)
        sqr42.addGestureRecognizer(tap42)
        sqr43.addGestureRecognizer(tap43)
        sqr44.addGestureRecognizer(tap44)
        sqr45.addGestureRecognizer(tap45)
        sqr46.addGestureRecognizer(tap46)
        sqr47.addGestureRecognizer(tap47)
        sqr48.addGestureRecognizer(tap48)
        
        sqr50.addGestureRecognizer(tap50)
        sqr51.addGestureRecognizer(tap51)
        sqr52.addGestureRecognizer(tap52)
        sqr53.addGestureRecognizer(tap53)
        sqr54.addGestureRecognizer(tap54)
        sqr55.addGestureRecognizer(tap55)
        sqr56.addGestureRecognizer(tap56)
        sqr57.addGestureRecognizer(tap57)
        sqr58.addGestureRecognizer(tap58)
    
        sqr60.addGestureRecognizer(tap60)
        sqr61.addGestureRecognizer(tap61)
        sqr62.addGestureRecognizer(tap62)
        sqr63.addGestureRecognizer(tap63)
        sqr64.addGestureRecognizer(tap64)
        sqr65.addGestureRecognizer(tap65)
        sqr66.addGestureRecognizer(tap66)
        sqr67.addGestureRecognizer(tap67)
        sqr68.addGestureRecognizer(tap68)
        
        sqr70.addGestureRecognizer(tap70)
        sqr71.addGestureRecognizer(tap71)
        sqr72.addGestureRecognizer(tap72)
        sqr73.addGestureRecognizer(tap73)
        sqr74.addGestureRecognizer(tap74)
        sqr75.addGestureRecognizer(tap75)
        sqr76.addGestureRecognizer(tap76)
        sqr77.addGestureRecognizer(tap77)
        sqr78.addGestureRecognizer(tap78)
    
        sqr80.addGestureRecognizer(tap80)
        sqr81.addGestureRecognizer(tap81)
        sqr82.addGestureRecognizer(tap82)
        sqr83.addGestureRecognizer(tap83)
        sqr84.addGestureRecognizer(tap84)
        sqr85.addGestureRecognizer(tap85)
        sqr86.addGestureRecognizer(tap86)
        sqr87.addGestureRecognizer(tap87)
        sqr88.addGestureRecognizer(tap88)
        
        for sqr in allSquares
        {
            sqr.text = String(sqr.tag)
        }
        
        let games = game.randomPuzzle()
        solved = games[0]
        unsolved = games[1]
        
        fillPuzzle(numbers: unsolved)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func onLabelClick(sender:UITapGestureRecognizer) {
        deselectAll()
        allSquares[sender.view?.tag ?? -1].backgroundColor = UIColor(red: 150/255, green: 187/255, blue: 255/255, alpha: 1)
        self.selectedSquareIndex = sender.view?.tag ?? -1
    }
    
    @IBAction func oneClicked(_ sender: UIButton) {
        allSquares[self.selectedSquareIndex].text = "1"
    }
    
    @IBAction func twoClicked(_ sender: UIButton) {
        allSquares[self.selectedSquareIndex].text = "2"
    }
    
    @IBAction func threeClicked(_ sender: UIButton) {
        allSquares[self.selectedSquareIndex].text = "3"
    }
    
    @IBAction func fourClicked(_ sender: UIButton) {
        allSquares[self.selectedSquareIndex].text = "4"
    }

    @IBAction func fiveClicked(_ sender: UIButton) {
        allSquares[self.selectedSquareIndex].text = "5"
    }

    @IBAction func sixClicked(_ sender: UIButton) {
        allSquares[self.selectedSquareIndex].text = "6"
    }

    @IBAction func sevenClicked(_ sender: UIButton) {
        allSquares[self.selectedSquareIndex].text = "7"
    }

    @IBAction func eightClicked(_ sender: UIButton) {
        allSquares[self.selectedSquareIndex].text = "8"
    }

    @IBAction func nineClicked(_ sender: UIButton) {
        allSquares[self.selectedSquareIndex].text = "9"
    }
    
    @IBAction func newGameClicked(_ sender: UIButton)
    {
        let games = game.randomPuzzle()
        solved = games[0]
        unsolved = games[1]
        
        fillPuzzle(numbers: unsolved)
    }
    
    @IBAction func checkSolutionClicked(_ sender: UIButton) {
        for (sqrIndex, sqr) in allSquares.enumerated()
        {
            if sqr.text! != ""
            {
                if sqr.text! != String(solved[sqrIndex])
                {
                    sqr.backgroundColor = UIColor.red
                }
                else
                {
                    sqr.backgroundColor = UIColor.green
                }
            }
        }
    }
    
    func fillPuzzle(numbers : String)
    {
        for (sqrIndex, sqr) in allSquares.enumerated()
        {
            if numbers[sqrIndex] == "0"
            {
                sqr.text = ""
            }
            else
            {
                sqr.text = String(numbers[sqrIndex])
            }
        }
    }
    
    func deselectAll()
    {
        for sqr in allSquares
        {
            sqr.backgroundColor = background
        }
    }
    
    @IBAction func doneClicked(_ sender: UIBarButtonItem)
    {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
