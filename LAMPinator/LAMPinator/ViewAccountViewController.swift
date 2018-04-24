//
//  ViewAccountViewController.swift
//  LAMPinator
//
//  Created by Jacob Kessler on 4/24/18.
//  Copyright © 2018 jck125.case.edu. All rights reserved.
//

import UIKit

class ViewAccountViewController: UIViewController
{
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        usernameLabel.text = User.loggedIn.username
        passwordLabel.text = User.loggedIn.password
        firstNameLabel.text = User.loggedIn.firstName
        lastNameLabel.text = User.loggedIn.lastName
        emailLabel.text = User.loggedIn.email
        dobLabel.text = User.loggedIn.dob
        
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
