//
//  SudokuHelpViewController.swift
//  puzzlinator
//
//  Created by Jacob Kessler on 5/3/18.
//  Copyright © 2018 EECS 392. All rights reserved.
//

import UIKit

class SudokuHelpViewController: UIViewController {

    
    @IBAction func closeClicked(_ sender: UIBarButtonItem)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
