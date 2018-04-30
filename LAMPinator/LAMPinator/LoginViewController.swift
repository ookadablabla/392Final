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
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginClicked(_ sender: UIButton)
    {
        loginButton.isHidden = true
        spinner.isHidden = false
        spinner.startAnimating()
        
        let logindata : [String : Any] = [
            "username":usernameField.text!,
            "password":passwordField.text!
        ]
        let jsondata = WebHooks.dictToJson(data: logindata)
        let request = WebHooks.formRequest(data: jsondata!, action: .login)
        WebHooks.sendRequest(request: request) { (data) in
            if let success = data["SUCCESS"] as? String
            {
                if let username = data["USERNAME"] as? String
                {
                    User.loggedIn.username = username
                }
                if let password = data["PASSWORD"] as? String
                {
                    User.loggedIn.password = password
                }
                if let firstname = data["FIRSTNAME"] as? String
                {
                    User.loggedIn.firstName = firstname
                }
                if let lastname = data["LASTNAME"] as? String
                {
                    User.loggedIn.lastName = lastname
                }
                if let email = data["EMAIL"] as? String
                {
                    User.loggedIn.email = email
                }
                if let dob = data["DOB"] as? String
                {
                    User.loggedIn.dob = dob
                }
                
                OperationQueue.main.addOperation
                {
                    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "viewAccount")
                    self.present(vc, animated:true, completion:nil)
                }
            }
            else if let fail = data["ERROR"] as? String
            {
                if fail.elementsEqual("Invalid Username.")
                {
                    //popup thing
                }
                else if fail.elementsEqual("Invalid Password.")
                {
                    
                }
                
                print(fail)
                //print(data["DEBUG"] as! String)
            }
        }

        //todo
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        loginButton.isEnabled = false
        
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
