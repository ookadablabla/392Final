//
//  ViewController.swift
//  puzzlinator
//
//  Created by Quinten Hutchison on 4/21/18.
//  Copyright © 2018 EECS 392. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let gameNames = ["Suduko", "Towers", "8Puzzle", "Tents"]
    let imageNames = ["placeholder", "placeholder", "placeholder", "placeholder"]
    let segues = ["toSudoku", "toTowers", "to8puzzle", "toTents"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameNames.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier:"cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCellViewController
        cell.myImage.image = UIImage(named: imageNames[indexPath.row] + ".png")
        cell.myLabel.text = gameNames[indexPath.row]
        
        return cell
    }

    func tableView(_ tableview: UITableView, didSelectRowAt indexpath: IndexPath) {
        performSegue(withIdentifier: segues[indexpath.row], sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

