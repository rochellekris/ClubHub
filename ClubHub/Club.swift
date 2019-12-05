//
//  Club.swift
//  ClubHub
//
//  Created by Rochelle Kris on 11/21/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//
import Foundation


//class Club{
//    var name: String
//    var description: String
//    var imageName: String
//    var tags: [String]
//    var level: String
//    var appReq: Bool
//    
//    init(name: String, description: String, imageName: String, tags: [String], level: String, appReq: Bool) {
//        self.name = name
//        self.description = description
//        self.imageName = imageName
//        self.tags = tags
//        self.level = level
//        self.appReq = appReq
//    }
//    
//}

//
//  Club.swift
//  ClubHub
//
//  Created by Rafael Chaves on 12/4/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//

import UIKit

struct Club: Codable {
    let id: Int
    let name: String
    let description: String
    let level: String
    let application_required: Bool
    let interested_users: [User]
    let category: String
    let href: String
}

struct ClubResponse: Codable {
    var data: [Club]
}
