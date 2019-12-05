//
//  NetworkManager.swift
//  ClubHub
//
//  Created by Rafael Chaves on 12/4/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

//enum SearchType {
//    case ingredients
//    case title
//}

class NetworkManager {

    private static let clubsURL = "replace"

    static func getClubs() {
        Alamofire.request(clubsURL, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error.localizedDescription) 
            }
        }
    }
}

