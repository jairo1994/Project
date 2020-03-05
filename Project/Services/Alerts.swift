//
//  Alerts.swift
//  Project
//
//  Created by Jairo on 05/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import Foundation
import NotificationBannerSwift

enum imageAlert: String {
    case warning = "warning"
    case danger = "error"
    case success = "success"
    case info = "info"
}

class Alerts{
    static func showAlert(title: String, subtitle: String, type: imageAlert = .info){
        let leftView = UIImageView(image: UIImage(named: type.rawValue))
        var typeAlert: BannerStyle!
        switch type {
        case .warning:
            typeAlert = .warning
            break
        case .danger:
            typeAlert = .danger
            break
        case .success:
            typeAlert = .success
            break
        case .info:
            typeAlert = .info
            break
        }
        
        let banner = NotificationBanner(title: title, subtitle: subtitle, leftView: leftView, style: typeAlert)
        banner.show()

    }
}
