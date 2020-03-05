//
//  CategoryModel.swift
//  Xcaret
//
//  Created by Jairo on 03/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import Foundation


struct CategoryModel: Codable {
    var name: String
    var id: Int
    var activities: [ActivityModel]
}
