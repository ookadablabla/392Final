//
//  TableViewCellViewController.swift
//  puzzlinator
//
//  Created by Jacob Kessler on 4/23/18.
//  Copyright © 2018 EECS 392. All rights reserved.
//

import UIKit

class TableViewCellViewController: UITableViewCell {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
