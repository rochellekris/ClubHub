//
//  User.swift
//  ClubHub
//
//  Created by Rafael Chaves on 12/4/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//

import UIKit

struct User: Codable {
    let id: Integer
    let netid: String
    let password: String
    let favorite_clubs: [Club]
    let created_posts: [Post]
    let liked_posts: [Post]
}
