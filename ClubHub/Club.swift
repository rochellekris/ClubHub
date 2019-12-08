//
//  Club.swift
//  ClubHub
//
//  Created by Rafael Chaves on 12/4/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//

struct Club: Codable {
    var id: Int
    var name: String
    var description: String
    var level: String
    var application_required: Bool?
    var interested_users: [bareUser]
    var category: String
    var href: String?
}

struct bareClub: Codable {
    var id: Int
    var name: String
    var description: String
    var level: String
    var application_required: Bool?
    var category: String
    var href: String?
}

struct ClubsResponse: Codable {
    var data: [Club]
}

struct ClubResponse: Codable {
    var data: Club
}

struct bareClubResponse: Codable {
    var data: bareClub
}
