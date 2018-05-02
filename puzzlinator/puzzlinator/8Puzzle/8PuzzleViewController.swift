//
//  8PuzzleViewController.swift
//  puzzlinator
//
//  Created by Jacob Kessler on 4/30/18.
//  Copyright © 2018 EECS 392. All rights reserved.
//

import UIKit

class _PuzzleViewController: UIViewController
{
    var allSquares : [UILabel] = []
    var allPoints : [CGPoint] = []
    
    var order : [[Int]] = []
    
    @IBOutlet weak var blankLabel: UILabel!
    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet weak var twoLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    @IBOutlet weak var fourLabel: UILabel!
    @IBOutlet weak var fiveLabel: UILabel!
    @IBOutlet weak var sixLabel: UILabel!
    @IBOutlet weak var sevenLabel: UILabel!
    @IBOutlet weak var eightLabel: UILabel!
    
    var blankPoint : CGPoint = CGPoint()
    var onePoint : CGPoint = CGPoint()
    var twoPoint : CGPoint = CGPoint()
    var threePoint : CGPoint = CGPoint()
    var fourPoint : CGPoint = CGPoint()
    var fivePoint : CGPoint = CGPoint()
    var sixPoint : CGPoint = CGPoint()
    var sevenPoint : CGPoint = CGPoint()
    var eightPoint : CGPoint = CGPoint()
    
    var selectedA : UILabel = UILabel()
    var selectedB : UILabel = UILabel()
    
    @IBOutlet weak var moveButton: UIButton!
    
    func checkIfDone() -> Bool
    {
        for (sqrIndex, sqr) in allSquares.enumerated()
        {
            if sqr.center != allPoints[sqrIndex]
            {
                return false
            }
        }
        return true
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        blankPoint = blankLabel.center
        onePoint = oneLabel.center
        twoPoint = twoLabel.center
        threePoint = threeLabel.center
        fourPoint = fourLabel.center
        fivePoint = fiveLabel.center
        sixPoint = sixLabel.center
        sevenPoint = sevenLabel.center
        eightPoint = eightLabel.center
        
        allSquares.append(oneLabel)
        allSquares.append(twoLabel)
        allSquares.append(threeLabel)
        allSquares.append(fourLabel)
        allSquares.append(fiveLabel)
        allSquares.append(sixLabel)
        allSquares.append(sevenLabel)
        allSquares.append(eightLabel)
        
        allPoints.append(onePoint)
        allPoints.append(twoPoint)
        allPoints.append(threePoint)
        allPoints.append(fourPoint)
        allPoints.append(fivePoint)
        allPoints.append(sixPoint)
        allPoints.append(sevenPoint)
        allPoints.append(eightPoint)

        let tap1 = UITapGestureRecognizer(target: self, action: #selector(_PuzzleViewController.switch1(sender:)))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(_PuzzleViewController.switch2(sender:)))
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(_PuzzleViewController.switch3(sender:)))
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(_PuzzleViewController.switch4(sender:)))
        let tap5 = UITapGestureRecognizer(target: self, action: #selector(_PuzzleViewController.switch5(sender:)))
        let tap6 = UITapGestureRecognizer(target: self, action: #selector(_PuzzleViewController.switch6(sender:)))
        let tap7 = UITapGestureRecognizer(target: self, action: #selector(_PuzzleViewController.switch7(sender:)))
        let tap8 = UITapGestureRecognizer(target: self, action: #selector(_PuzzleViewController.switch8(sender:)))
        
        oneLabel.addGestureRecognizer(tap1)
        twoLabel.addGestureRecognizer(tap2)
        threeLabel.addGestureRecognizer(tap3)
        fourLabel.addGestureRecognizer(tap4)
        fiveLabel.addGestureRecognizer(tap5)
        sixLabel.addGestureRecognizer(tap6)
        sevenLabel.addGestureRecognizer(tap7)
        eightLabel.addGestureRecognizer(tap8)

        randomizeGame()
    }
    
    func randomizeGame()
    {
        var i = 0
        
        while i < 100
        {
            swapTile(tile: allSquares[Int(arc4random_uniform(UInt32(allSquares.count)))])
            i += 1
        }
    }
    
    @IBAction func newGamePressed(_ sender: UIButton)
    {
        randomizeGame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getPositionOfInt(num : Int) -> [Int]
    {
        for (indexR, row) in order.enumerated()
        {
            for (indexC, col) in row.enumerated()
            {
                if col == num
                {
                    return [indexR, indexC]
                }
            }
        }
        
        return []
    }
    
    func swapTile(tile : UILabel)
    {
        UIView.animate(withDuration: 1, delay: 0, animations: {
            let temp : CGPoint = tile.center
            tile.center = self.blankLabel.center
            self.blankLabel.center = temp
            }, completion: nil)
    }
    
    func checkForWin()
    {
        if (oneLabel.center == onePoint) &&
            (twoLabel.center == twoPoint) &&
            (threeLabel.center == threePoint) &&
            (fourLabel.center == fourPoint) &&
            (fiveLabel.center == fivePoint) &&
            (sixLabel.center == sixPoint) &&
            (sevenLabel.center == sevenPoint) &&
            (eightLabel.center == eightPoint)
        {
            let alert = UIAlertController(title: "You Won!", message: "Press to start a new game.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { action in
                self.randomizeGame()
            }))

            self.present(alert, animated: true)

        }
        else
        {
            return
        }
    }
    
    
    @objc func switch1(sender:UITapGestureRecognizer)
    {
        print("tap working1")
        if (oneLabel.center.x == blankLabel.center.x && abs(oneLabel.center.y-blankLabel.center.y) < 200) ||
            (oneLabel.center.y == blankLabel.center.y && abs(oneLabel.center.x-blankLabel.center.x) < 200)
        {
            swapTile(tile: oneLabel)
            checkForWin()
        }
    }
    
    @objc func switch2(sender:UITapGestureRecognizer)
    {
        print("tap working2")
        if (twoLabel.center.x == blankLabel.center.x && abs(twoLabel.center.y-blankLabel.center.y) < 200) ||
            (twoLabel.center.y == blankLabel.center.y && abs(twoLabel.center.x-blankLabel.center.x) < 200)
        {
            swapTile(tile: twoLabel)
            checkForWin()
        }
    }

    @objc func switch3(sender:UITapGestureRecognizer)
    {
        print("tap working3")
        if (threeLabel.center.x == blankLabel.center.x && abs(threeLabel.center.y-blankLabel.center.y) < 200) ||
            (threeLabel.center.y == blankLabel.center.y && abs(threeLabel.center.x-blankLabel.center.x) < 200)
        {
            swapTile(tile: threeLabel)
            checkForWin()
        }
    }

    @objc func switch4(sender:UITapGestureRecognizer)
    {
        print("tap working4")
        if (fourLabel.center.x == blankLabel.center.x && abs(fourLabel.center.y-blankLabel.center.y) < 200) ||
            (fourLabel.center.y == blankLabel.center.y && abs(fourLabel.center.x-blankLabel.center.x) < 200)
        {
            swapTile(tile: fourLabel)
            checkForWin()
        }
    }

    @objc func switch5(sender:UITapGestureRecognizer)
    {
        print("tap working5")
        if (fiveLabel.center.x == blankLabel.center.x && abs(fiveLabel.center.y-blankLabel.center.y) < 200) ||
            (fiveLabel.center.y == blankLabel.center.y && abs(fiveLabel.center.x-blankLabel.center.x) < 200)
        {
            swapTile(tile: fiveLabel)
            checkForWin()
        }
    }

    @objc func switch6(sender:UITapGestureRecognizer)
    {
        print("tap working6")
        if (sixLabel.center.x == blankLabel.center.x && abs(sixLabel.center.y-blankLabel.center.y) < 200) ||
            (sixLabel.center.y == blankLabel.center.y && abs(sixLabel.center.x-blankLabel.center.x) < 200)
        {
            swapTile(tile: sixLabel)
            checkForWin()
        }
    }

    @objc func switch7(sender:UITapGestureRecognizer)
    {
        print("tap working7")
        if (sevenLabel.center.x == blankLabel.center.x && abs(sevenLabel.center.y-blankLabel.center.y) < 200) ||
            (sevenLabel.center.y == blankLabel.center.y && abs(sevenLabel.center.x-blankLabel.center.x) < 200)
        {
            swapTile(tile: sevenLabel)
            checkForWin()
        }
    }

    @objc func switch8(sender:UITapGestureRecognizer)
    {
        print("tap working8")
        if (eightLabel.center.x == blankLabel.center.x && abs(eightLabel.center.y-blankLabel.center.y) < 200) ||
            (eightLabel.center.y == blankLabel.center.y && abs(eightLabel.center.x-blankLabel.center.x) < 200)
        {
            swapTile(tile: eightLabel)
            checkForWin()
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
