//
//  Club.swift
//  ClubHub
//
//  Created by Rochelle Kris on 11/21/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//

import Foundation


class Club{
    var name: String
    var description: String
    var imageName: String
    var tags: [String]
    var level: String
    var appReq: Bool
    
    init(name: String, description: String, imageName: String, tags: [String], level: String, appReq: Bool) {
        self.name = name
        self.description = description
        self.imageName = imageName
        self.tags = tags
        self.level = level
        self.appReq = appReq
    }
    
}
