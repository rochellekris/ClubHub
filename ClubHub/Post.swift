//
//  Post.swift
//  ClubHub
//
//  Created by Rafael Chaves on 12/4/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//

import Foundation

struct Post: Codable {
    var id: Int
    var title: String
    var body: String
    var author_id: Int
    var interested_users: [User]
}

struct PostsResponse: Codable {
    var data: [Post]
}

struct PostResponse: Codable {
    var data: Post
}
