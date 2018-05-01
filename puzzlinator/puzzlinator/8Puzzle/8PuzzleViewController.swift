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
    
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer)
    {
        let translation = recognizer.translation(in: self.view)
        
        if let view = recognizer.view
        {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y)
        }
        
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        blankPoint = blankLabel.center
        onePoint = oneLabel.center
        twoPoint = twoLabel.center
        threePoint = threeLabel.center
        fourPoint = fourLabel.center
        fivePoint = fiveLabel.center
        sixPoint = sixLabel.center
        sevenPoint = sevenLabel.center
        eightPoint = eightLabel.center
        
        //randomize tiles here
        //remeber to hide blank tile, just want it to get the last coordinate and stuff
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
