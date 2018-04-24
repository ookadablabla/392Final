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
    
}
