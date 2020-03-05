//
//  ActivityModel.swift
//  Xcaret
//
//  Created by Jairo on 03/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

struct ActivityModel: Codable {
    var name: String
    var img: String
    var desc: String
    var horario: String
    var id: Int
    var itHasAdditionalCost: Bool
    
    init(){
        name = ""
        img = ""
        desc = ""
        horario = ""
        id = 0
        itHasAdditionalCost = false
    }
    
    init(name: String, img: String, desc: String, horario: String, id: Int, itHasAdditionalCost: Bool) {
        self.name = name
        self.img = img
        self.desc = desc
        self.horario = horario
        self.id = id
        self.itHasAdditionalCost = itHasAdditionalCost
    }
}

struct activitySaved: Codable, DefaultsSerializable{
    var idPark: Int
    var idActivity: Int
}
