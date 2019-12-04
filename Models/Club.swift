//
//  Club.swift
//  ClubHub
//
//  Created by Rafael Chaves on 12/4/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//

import UIKit

struct Club: Codable {
    let id: Integer
    let name: String
    let description: String
    let level: String
    let application_required: Boolean
    let interested_users: [User]
    let category: String
    let href: String
}

struct ClubSearchResponse: Codable {
    var data: [Club]
}
