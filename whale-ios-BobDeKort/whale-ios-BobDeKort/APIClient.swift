//
//  APIClient.swift
//  whale-ios-BobDeKort
//
//  Created by Bob De Kort on 3/22/17.
//  Copyright © 2017 Bob De Kort. All rights reserved.
//

import Foundation
import Alamofire
import KeychainSwift

class APIClient {
    static var sharedInstance = APIClient()
    
    let baseUrl = "https://whale2-elixir.herokuapp.com/api/v1/"
    
    func signUp(email: String, firstName: String, lastName: String, password: String, userName: String, completionHandler: @escaping (Bool) -> Void){
        let urlString = baseUrl + "users"
        
        let body: [String: String] =
            ["email": email,
            "first_name": firstName,
            "last_name": lastName,
            "password": password,
            "username": userName]
        
        Alamofire.request(urlString, method: .post, parameters: body).responseJSON { (response) in
            
            print(response)
            guard response.result.error == nil else {

                print(response.result.error!)
                
                completionHandler(false)
                return
            }
            
            guard let json = response.result.value as? [String: AnyObject] else {
                print("didn't get objects as JSON from API")
                
                completionHandler(false)
                return
            }
            
            print(json)
            
            
        }
    }
    
    func login(email: String, password: String, completionHandler: @escaping (Bool) -> Void){
        let urlString = baseUrl + "sessions"
        
//        let body: [String: String] =
//            ["email": email,
//            "password": password]
        
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            let postString = "email=\(email)&password=\(password)"
            request.httpBody = postString.data(using: .utf8)
        
            Alamofire.request(request).responseJSON { (response) in
                guard response.result.error == nil else {
                    
                    print(response.result.error!)
                    
                    completionHandler(false)
                    return
                }
                
                guard let json = response.result.value as? [String: AnyObject] else {
                    print("didn't get objects as JSON from API")
                    
                    completionHandler(false)
                    return
                }
                
                if let token = response.response?.allHeaderFields["Authorization"] as? String {
                    let keychain = KeychainSwift()
                    keychain.set(token, forKey: "user_token")
                    completionHandler(true)
                }
                
                // TODO: Make User Object, Store User
                
            }
        }
    }
}
