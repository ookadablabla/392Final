//
//  WebHooks.swift
//  LAMPinator
//
//  Created by Jacob Kessler on 4/24/18.
//  Copyright © 2018 jck125@case.edu. All rights reserved.
//
import UIKit
import Foundation

public class WebHooks {
    enum Actions:String {
        case login = "login"
        case createAccount = "newAccount"
    }
    
    //converts a dictionary to a json string
    private static func dictToJson(data:[String:Any]) -> String? {
        if let json = try? JSONSerialization.data(withJSONObject: data, options: .prettyPrinted) {
            let jsonString = String(data:json, encoding: .utf8)
            return jsonString
        } else {
            return nil
        }
    }
	
	private static func formLoginRequest(data : String, action : Actions) -> URLRequest {
        //build up the request
        let url = URL(string: "http://crwl.a2hosted.com/webHooks/iosDemo.php")!
        var request = URLRequest(url:url)
        
        //setup headers
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
		
        //add the data to the request
        let postString = "iosDemo="+data+"&"+action.rawValue+"=true"
        request.httpBody = postString.data(using: .utf8)
        
        return request
	}
    
    static func sendRequest(request : URLRequest, callback: @escaping ((_ data: [String: Any])-> Void)) {
	
        //send the request to the server
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

            //check for error
            guard let data = data, error == nil else {
                print("error=\(String(describing: error))")
                return
            }
            
            //check status code
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            
            //return data to callback
            //let responseString = String(data: data, encoding:.utf8)
            print(data)
            let jsonObject = try? JSONSerialization.jsonObject(with: data, options: [])
            let json = jsonObject as! [String: Any]
            callback(json)
        }
        task.resume()
    }
}
