//
//  CreateAccountViewController.swift
//  LAMPinator
//
//  Created by Jacob Kessler on 4/24/18.
//  Copyright © 2018 jck125.case.edu. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController
{

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var dobPicker: UIDatePicker!
    
    @IBOutlet weak var createButton: UIBarButtonItem!
    
    @IBAction func createClicked(_ sender: UIBarButtonItem)
    {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        let dateString = df.string(from: dobPicker.date)
        
        let logindata : [String : Any] = [
            "username":usernameField.text!,
            "password":passwordField.text!,
            "firstName":firstNameField.text!,
            "lastName":lastNameField.text!,
            "email":emailField.text!,
            "DOB":dateString
        ]
        
        let jsondata = WebHooks.dictToJson(data: logindata)
        let request = WebHooks.formRequest(data: jsondata!, action: .createAccount)
        WebHooks.sendRequest(request: request) { (data) in
            if let _ = data["SUCCESS"] as? String
            {
                OperationQueue.main.addOperation
                {
                    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "home")
                    self.present(vc, animated:true, completion:nil)
                }
            }
            else if let fail = data["ERROR"] as? String
            {
                if fail.elementsEqual("Username taken.")
                {
                    
                }
                
                print(fail)
            }
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        createButton.isEnabled = false
        
        usernameField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        firstNameField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        lastNameField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        emailField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            let first = firstNameField.text, !first.isEmpty,
            let last = lastNameField.text, !last.isEmpty,
            let user = usernameField.text, !user.isEmpty,
            let pass = passwordField.text, !pass.isEmpty,
            let email = emailField.text, !email.isEmpty
            else
        {
            createButton.isEnabled = false
            return
        }
        
        createButton.isEnabled = true
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