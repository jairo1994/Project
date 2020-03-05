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
    var isUserRegistered: DefaultsKey<Int> { return .init("isUserRegistered", defaultValue: 0) }
    var userInfo: DefaultsKey<UserModel> { return .init("userInfo", defaultValue: UserModel()) }
    var activitiesThatUSerLike: DefaultsKey<[activitySaved]> { return .init("activitiesThatUSerLike", defaultValue: [activitySaved]()) }
}

class UserDefaults{
    static var isUserRegistered: userState{
        return userState.init(rawValue: Defaults.isUserRegistered)!
    }
    
    static func setIsUserRegistered(_ needs: userState){
        Defaults.isUserRegistered = needs.rawValue
    }
    
    static var userInfo: UserModel{
        return Defaults.userInfo
    }
    
    static func setUserInfo(_ user: UserModel){
        Defaults.userInfo = user
    }
    
    static var activitiesThatUSerLike: [activitySaved]{
        return Defaults.activitiesThatUSerLike
    }
    
    static func addActivityThatUserLike(_ id: activitySaved){
        Defaults.activitiesThatUSerLike.append(id)
    }
    
    static func setAllActivitiesThatUserLike(_ ids: [activitySaved]){
        Defaults.activitiesThatUSerLike = ids
    }
    
    
}

