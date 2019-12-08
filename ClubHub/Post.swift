//
//  Post.swift
//  ClubHub
//
//  Created by Rafael Chaves on 12/4/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//

struct Post: Codable {
    var id: Int
    var title: String
    var body: String
    var author_id: Int
    var interested_users: [bareUser]
}

struct barePost: Codable {
    var id: Int
    var title: String
    var body: String
    var author_id: Int
}

struct PostsResponse: Codable {
    var data: [Post]
}

struct PostResponse: Codable {
    var data: Post
}

struct barePostResponse: Codable {
    var data: barePost
}
