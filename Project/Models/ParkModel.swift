//
//  ParkModel.swift
//  Xcaret
//
//  Created by Jairo on 03/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import Foundation
/*nombre, imagen, categoría, breve descripción, horario, un acceso al mapa y agregar a mis favoritos*/
struct ParkModel: Codable {
    var name: String
    var slogan: String
    var imgthumb: String
    var desc: String
    var img: String
    var schedule: String
    var latitude: Double
    var longitude: Double
    var address: String
    var category: [CategoryModel]
    var included: [String]
    
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
        category = [CategoryModel]()
        included = [String]()
    }
    
    init(name:String, slogan:String, imgthumb:String, desc:String, img:String, schedule:String, latitude:Double, longitude:Double, address:String, category: [CategoryModel], included: [String]){
        self.name = name
        self.slogan = slogan
        self.imgthumb = imgthumb
        self.desc = desc
        self.img = img
        self.schedule = schedule
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.category = category
        self.included = included
    }
    
    func getSpecificActivityBy(id: Int, Callback: @escaping(_ activity: ActivityModel, _ slogan: String)->Void){
        category.forEach { (category) in
            category.activities.forEach { (activity) in
                if activity.id == id{
                    Callback(activity, category.name)
                    return
                }
            }
        }
        
    }
}


