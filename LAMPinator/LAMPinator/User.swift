//
//  User.swift
//  LAMPinator
//
//  Created by Jacob Kessler on 4/24/18.
//  Copyright © 2018 jck125.case.edu. All rights reserved.
//

import Foundation

class User
{
    var username : String = ""
    var password : String = ""
    var firstName : String = ""
    var lastName : String = ""
    var email : String = ""
    var dob : String = ""
    
    public static var loggedIn : User = User()
    
    func toDict() -> [String : Any] {
        return [
            "username"  : username,
            "password"  : password,
            "firstName" : firstName,
            "lastName"  : lastName,
            "email"     : email,
            "dob"       : dob
        ]
    }
    
    public static func fromDictionary(_ data : [String : Any]) -> User {
        let ret = User();
        
        if let username = data["USERNAME"] as? String {
            ret.username = username
        } else {
            print("Username not provided! Defaulting to \(ret.username)")
        }
        
        if let password = data["PASSWORD"] as? String {
            ret.password = password
        } else {
            print("Password not provided! Defaulting to \(ret.password)")
        }
        
        if let firstname = data["FIRSTNAME"] as? String {
            ret.firstName = firstname
        } else {
            print("First name not provided! Defaulting to \(ret.firstName)")
        }
        
        if let lastname = data["LASTNAME"] as? String {
            ret.lastName = lastname
        } else {
            print("Last name not provided! Defaulting to \(ret.lastName)")
        }
        
        if let email = data["EMAIL"] as? String {
            ret.email = email
        } else {
            print("Email not provided! Defaulting to \(ret.email)")
        }
        
        if let dob = data["DOB"] as? String {
            ret.dob = dob
        } else {
            print("Date of birth not provided! Defaulting to \(ret.dob)")
        }
        
        return ret;
    }
    
    
    
}
