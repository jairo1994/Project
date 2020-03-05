//
//  ActivityModel.swift
//  Xcaret
//
//  Created by Jairo on 03/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import Foundation

struct ActivityModel: Codable {
    var name: String
    var img: String
    var desc: String
    var horario: String
    
    init(){
        name = ""
        img = ""
        desc = ""
        horario = ""
    }
    
    init(name: String, img: String, desc: String, horario: String) {
        self.name = name
        self.img = img
        self.desc = desc
        self.horario = horario
    }
}
