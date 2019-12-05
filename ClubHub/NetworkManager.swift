//
//  NetworkManager.swift
//  ClubHub
//
//  Created by Rafael Chaves on 12/4/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//

import Foundation
import Alamofire
//import SwiftyJSON

 class NetworkManager {

    private static let url = "http://35.237.207.25"
    private static let clubsEndpoint = "/api/clubs/"
    private static let postsEndpoint = "/api/posts/"
    private static let usersEndpoint = "/api/users/"
    private static let loginEndpoint = "/login/"
    private static let registerEndpoint = "/register/"

    static func getClubs(parameters: [String: Any], completion: @escaping ([Club]) -> Void) {
        Alamofire.request(url + clubsEndpoint, method: .get, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let clubData = try? jsonDecoder.decode(ClubResponse.self, from: data) {
                    let clubs = clubData.data
                    completion(clubs)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    static func getPosts(completion: @escaping ([Post]) -> Void) {
        Alamofire.request(url + postsEndpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let postsData = try? jsonDecoder.decode(PostResponse.self, from: data) {
                    let posts = postsData.data
                    print(posts)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
//    static func getUsers(completion: @escaping ([User]) -> Void) {
//        Alamofire.request(url + usersEndpoint, method: .get).validate().responseData { response in
//            switch response.result {
//            case .success(let data):
//                let jsonDecoder = JSONDecoder()
//
//                if let usersData = try? jsonDecoder.decode(UserResponse.self, from: data) {
//                    let users = usersData.data
//                    print(users)
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    static func register(name: String, email: String, password: String) {
        let parameters: [String: Any] = [
            "name": name,
            "email": email,
            "password": password
        ]
        
        Alamofire.request(url + registerEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let userData = try? jsonDecoder.decode(UserResponse.self, from: data) {
                    print(userData.session_token)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    static func login(email: String, password: String) {
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]

        Alamofire.request(url + loginEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let userData = try? jsonDecoder.decode(UserResponse.self, from: data) {
                    print(userData.session_token)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
 }

