//
//  UserStateService.swift
//  Project
//
//  Created by Jairo on 04/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import Foundation

enum userState: Int {
    case login = 0
    case register
    case remember
}

class UserState {
    static var status: userState = userState(rawValue: 0)!
}
