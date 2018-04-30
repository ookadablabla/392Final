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
        
        //grab the login data
        let logindata : [String : Any] = [
            "username":usernameField.text!,
            "password":passwordField.text!
        ]
        
        //convert the login data to JSON format
        let jsondata = WebHooks.dictToJson(data: logindata)
        
        //form the request with the JSON data appended
        let request = WebHooks.formRequest(data: jsondata!, action: .login)
        
        //send the request
        WebHooks.sendRequest(request: request) { (data) in
            
            //if we received successful login from the server
            if let _ = data["SUCCESS"] as? String {

                User.loggedIn = User.fromDictionary(data);
                
                OperationQueue.main.addOperation {
                    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "viewAccount")
                    self.present(vc, animated:true, completion:nil)
                }
                
            //if we received an error from the server
            } else if let error = data["ERROR"] as? String {
                print(error)
                
                if error.elementsEqual(loginError.invalidUsername.rawValue) {
                    //popup thing
                } else if error.elementsEqual(loginError.invalidPassword.rawValue) {
                    
                }
            }
        }	
    }
    
    enum loginError : String {
        case invalidPassword = "Invalid Password."
        case invalidUsername = "Invalid Username."
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
