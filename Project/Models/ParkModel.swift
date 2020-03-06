//
//  ParkModel.swift
//  Xcaret
//
//  Created by Jairo on 03/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import Foundation

struct ParkModel: Codable {
    var idPark: Int
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
    var recomendations: [String]
    var primaryColor: String
    
    init(){
        idPark = 0
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
        recomendations = [String]()
        primaryColor = ""
    }
    
    init(idPark:Int, name:String, slogan:String, imgthumb:String, desc:String, img:String, schedule:String, latitude:Double, longitude:Double, address:String, category: [CategoryModel], included: [String], recomendations: [String], primaryColor: String){
        self.idPark = idPark
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
        self.primaryColor = primaryColor
        self.recomendations = recomendations
    }
    
    func getSpecificActivityBy(id: Int, Callback: @escaping(_ activity: ActivityModel, _ slogan: String, _ idCategory: Int)->Void){
        category.forEach { (category) in
            category.activities.forEach { (activity) in
                if activity.id == id{
                    Callback(activity, category.name, category.id)
                    return
                }
            }
        }
        
    }
}


