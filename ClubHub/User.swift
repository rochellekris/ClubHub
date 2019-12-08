//
//  User.swift
//  ClubHub
//
//  Created by Rafael Chaves on 12/4/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//

import Foundation
import UIKit

struct User: Codable {
    var id: Int
    var name: String
    var email: String
    var favorite_clubs: [bareClub]
    var created_posts: [barePost]
    var liked_posts: [barePost]
}

struct bareUser: Codable {
    var id: Int
    var name: String
    var email: String
}

struct SessionResponse: Codable {
    var session_token: String
    var session_expiration: String
    var update_token: String
}

struct UserResponse: Codable {
    var data: User
}

struct bareUserResponse: Codable {
    var data: bareUser
}
