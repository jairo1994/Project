//
//  ParkModel.swift
//  Xcaret
//
//  Created by Jairo on 03/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import Foundation
/*nombre, imagen, categoría, breve descripción, horario, un acceso al mapa y agregar a mis favoritos*/
struct ParkModel {
    var name: String
    var slogan: String
    var imgthumb: String
    var desc: String
    var img: String
    var schedule: String
    var latitude: Double
    var longitude: Double
    var address: String
    var id: Int //Esta variable ayudaria a realizar una petición para el detalle del parque, a no ser que toda la información se descargará al iniciar la app
    
    init(){
        name = ""
        slogan = ""
        imgthumb = ""
        desc = ""
        img = ""
        schedule = ""
        latitude = 0.0
        longitude = 0.0
        address = ""
        id = 0
    }
    
    init(name:String, slogan:String, imgthumb:String, desc:String, img:String, schedule:String, latitude:Double, longitude:Double, address:String, id: Int){
        self.name = name
        self.slogan = slogan
        self.imgthumb = imgthumb
        self.desc = desc
        self.img = img
        self.schedule = schedule
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.id = id
    }
}


