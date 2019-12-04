//
//  Post.swift
//  ClubHub
//
//  Created by Rafael Chaves on 12/4/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//

import UIKit

struct Post: Codable {
    let id: Integer
    let title: String
    let body: String
    let author_id: Integer
    let interested_users: [User]
}
