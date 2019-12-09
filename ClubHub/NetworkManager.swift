//
//  NetworkManager.swift
//  ClubHub
//
//  Created by Rafael Chaves on 12/4/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    private static let url = "http://35.237.207.25"
    
    private static let clubsEndpoint = "/api/clubs/"
    private static let clubEndpoint = "/api/club/"
    
    private static let postsEndpoint = "/api/posts/"
    private static let postEndpoint = "/api/post/"
    
    private static let usersEndpoint = "/api/users/"
    private static let userEndpoint = "/api/user/"
    private static let loginEndpoint = "/login/"
    private static let registerEndpoint = "/register/"
    private static let sessionEndpoint = "/session/"
    private static let secretEndpoint = "/secret/"
    
    static func getClubs(parameters: [String: Any], completion: @escaping ([Club]) -> Void) {
        Alamofire.request(url + clubsEndpoint, method: .get, parameters: parameters, encoding: URLEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let clubData = try? jsonDecoder.decode(ClubsResponse.self, from: data) {
                    completion(clubData.data)
                }
                else if let errorMessage = try? jsonDecoder.decode(Error.self, from: data) {
                    print(errorMessage.error)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getClub(club_id: Int, completion: @escaping (Club) -> Void) {
        Alamofire.request(url + clubEndpoint + String(club_id) + "/", method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let clubData = try? jsonDecoder.decode(ClubResponse.self, from: data) {
                    completion(clubData.data)
                }
                else if let errorMessage = try? jsonDecoder.decode(Error.self, from: data) {
                    print(errorMessage.error)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func setUserDefaults(sessionData: SessionResponse) {
        userDefaults.set(sessionData.session_token, forKey: Strings.session_token)
        userDefaults.set(sessionData.update_token, forKey: Strings.update_token)
    }
    
    static func register(name: String, email: String, password: String, completion: @escaping (Bool, String) -> Void) {
        let parameters: [String: Any] = [
            "name": name,
            "email": email,
            "password": password
        ]
        
        Alamofire.request(url + registerEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let sessionData = try? jsonDecoder.decode(SessionResponse.self, from: data) {
                    setUserDefaults(sessionData: sessionData)
                    completion(true, "Successfully Registered")
                }
                else if let errorMessage = try? jsonDecoder.decode(Error.self, from: data) {
                    completion(false, errorMessage.error)
                }
                
            case .failure(let error):
                completion(false, error.localizedDescription)
            }
        }
    }
    
    static func login(email: String, password: String, completion: @escaping (Bool, String) -> Void) {
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        Alamofire.request(url + loginEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let sessionData = try? jsonDecoder.decode(SessionResponse.self, from: data) {
                    setUserDefaults(sessionData: sessionData)
                    completion(true, "Login Successful")
                }
                else if let errorMessage = try? jsonDecoder.decode(Error.self, from: data) {
                    completion(false, errorMessage.error)
                }
                
            case .failure(let error):
                completion(false, error.localizedDescription)
            }
        }
    }
    
    static func updateSession() {
        let bearerToken: String = userDefaults.string(forKey: Strings.update_token) ?? ""
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(bearerToken)"
        ]
        
        Alamofire.request(url + sessionEndpoint, method: .post, headers: headers).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let sessionData = try? jsonDecoder.decode(SessionResponse.self, from: data) {
                    setUserDefaults(sessionData: sessionData)
                    print("Successfully updated session")
                }
                else if let errorMessage = try? jsonDecoder.decode(Error.self, from: data) {
                    print(errorMessage.error)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getCurrentUserId(completion: @escaping (Int) -> Void) {
        let bearerToken: String = userDefaults.string(forKey: Strings.session_token) ?? ""
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(bearerToken)"
        ]
        
        Alamofire.request(url + secretEndpoint, method: .get, headers: headers).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let userData = try? jsonDecoder.decode(UserResponse.self, from: data) {
                    completion(userData.data.id)
                }
                else if let errorMessage = try? jsonDecoder.decode(Error.self, from: data) {
                    print(errorMessage.error)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getUser(user_id: Int, completion: @escaping (User) -> Void) {
        Alamofire.request(url + userEndpoint + String(user_id) + "/", method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let userData = try? jsonDecoder.decode(UserResponse.self, from: data) {
                    completion(userData.data)
                }
                else if let errorMessage = try? jsonDecoder.decode(Error.self, from: data) {
                    print(errorMessage.error)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func deleteUser(user_id: Int, completion: @escaping (bareUser) -> Void) {
        Alamofire.request(url + userEndpoint + String(user_id) + "/", method: .delete).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let userData = try? jsonDecoder.decode(bareUserResponse.self, from: data) {
                    completion(userData.data)
                }
                else if let errorMessage = try? jsonDecoder.decode(Error.self, from: data) {
                    print(errorMessage.error)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func addFavoriteClub(club_id: Int, completion: @escaping (User) -> Void) {
        getCurrentUserId { user_id in
            print(user_id)
            let parameters: [String: Any] = [
                "club_id": club_id
            ]
            print(url + userEndpoint + String(user_id) + "/favorite-clubs/")
            Alamofire.request(url + userEndpoint + String(user_id) + "/favorite-clubs/", method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
                switch response.result {
                case .success(let data):
                    let jsonDecoder = JSONDecoder()
                    
                    if let userData = try? jsonDecoder.decode(UserResponse.self, from: data) {
                        completion(userData.data)
                    }
                    else if let errorMessage = try? jsonDecoder.decode(Error.self, from: data) {
                        print(errorMessage.error)
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    static func unfollowClub() {
        //TODO
    }
    
    static func unfollowPost() {
        //TODO
    }
    
    static func addFavoritePost(post_id: Int, completion: @escaping (Bool, String) -> Void) {
        getCurrentUserId { user_id in
            let parameters: [String: Any] = [
                "post_id": post_id
            ]
            Alamofire.request(url + userEndpoint + String(user_id) + "/favorite-posts/", method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
                switch response.result {
                case .success(let data):
                    let jsonDecoder = JSONDecoder()
                    
                    if let userData = try? jsonDecoder.decode(UserResponse.self, from: data) {
                        completion(true, "Success")
                    }
                    else if let errorMessage = try? jsonDecoder.decode(Error.self, from: data) {
                        completion(false, errorMessage.error)
                    }
                    
                case .failure(let error):
                    completion(false, error.localizedDescription)
                }
            }
        }
    }
    
    static func getPosts(parameters: [String: Any], completion: @escaping ([Post]) -> Void) {
        Alamofire.request(url + postsEndpoint, method: .get, parameters: parameters, encoding: URLEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let postsData = try? jsonDecoder.decode(PostsResponse.self, from: data) {
                    completion(postsData.data)
                }
                else if let errorMessage = try? jsonDecoder.decode(Error.self, from: data) {
                    print(errorMessage.error)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func createPost(title: String, body: String, completion: @escaping (Post) -> Void) {
        getCurrentUserId { user_id in
            let parameters: [String: Any] = [
                "title": title,
                "body": body,
                "author_id": user_id
            ]
            Alamofire.request(url + postsEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
                switch response.result {
                case .success(let data):
                    let jsonDecoder = JSONDecoder()
                    
                    if let postsData = try? jsonDecoder.decode(PostResponse.self, from: data) {
                        completion(postsData.data)
                    }
                    else if let errorMessage = try? jsonDecoder.decode(Error.self, from: data) {
                        print(errorMessage.error)
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    static func getPost(post_id: Int, completion: @escaping (Post) -> Void) {
        Alamofire.request(url + postEndpoint + String(post_id) + "/", method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let postData = try? jsonDecoder.decode(PostResponse.self, from: data) {
                    completion(postData.data)
                }
                else if let errorMessage = try? jsonDecoder.decode(Error.self, from: data) {
                    print(errorMessage.error)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func deletePost(post_id: Int, completion: @escaping (barePost) -> Void) {
        Alamofire.request(url + postEndpoint + String(post_id) + "/", method: .delete).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let postData = try? jsonDecoder.decode(barePostResponse.self, from: data) {
                    completion(postData.data)
                }
                else if let errorMessage = try? jsonDecoder.decode(Error.self, from: data) {
                    print(errorMessage.error)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
