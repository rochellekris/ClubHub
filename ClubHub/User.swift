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
    var netid: String
    var password: String
//    var favorite_clubs: [Club]
    var created_posts: [Post]
    var liked_posts: [Post]
}

struct UserResponse: Codable {
    var session_token: String
    var session_expiration: String
    var update_token: String
}
