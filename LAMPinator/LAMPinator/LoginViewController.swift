//
//  LoginViewController.swift
//  LAMPinator
//
//  Created by Jacob Kessler on 4/24/18.
//  Copyright © 2018 jck125.case.edu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController
{
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    @IBAction func backClicked(_ sender: UIBarButtonItem)
    {
        
    }
    
    @IBAction func loginClicked(_ sender: UIButton)
    {
        loginButton.isHidden = true
        spinner.isHidden = false
        spinner.startAnimating()
        //todo
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        usernameField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)


        spinner.isHidden = true
        loginButton.isHidden = false
        // Do any additional setup after loading the view.
    }
    
    @objc func editingChanged(_ textField: UITextField)
    {
        if textField.text?.count == 1
        {
            if textField.text?.first == " "
            {
                textField.text = ""
                return
            }
        }
        guard
            let user = usernameField.text, !user.isEmpty,
            let pass = passwordField.text, !pass.isEmpty
            else
        {
            loginButton.isEnabled = false
            return
        }
        
        loginButton.isEnabled = true
    }


    override func didReceiveMemoryWarning()
    {
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
