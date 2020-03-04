//
//  UserDefaultsService.swift
//  Project
//
//  Created by Jairo on 04/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys{
    var isUserRegistered: DefaultsKey<Bool> { return .init("isUserRegistered", defaultValue: false) }
}

class UserDefaults{
    static var isUserRegistered: Bool{
        return Defaults.isUserRegistered
    }
    
    static func setNeedsReloadHomePage(_ needs: Bool){
        Defaults.isUserRegistered = needs
    }
}
