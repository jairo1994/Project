//
//  UserModel.swift
//  Project
//
//  Created by Jairo on 05/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

enum userState: Int {
    case login = 0
    case register
    case remember
    case registered
    case guest
}

struct UserModel: Codable, DefaultsSerializable{
    var name: String!
    var lastname: String!
    var country: String!
    var provincia: String!
    var telmovil: String!
    var mail: String!
    var password: String!
}

struct UserStatus: Codable, DefaultsSerializable{
    var status: Int!
}
