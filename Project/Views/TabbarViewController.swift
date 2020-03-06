//
//  TabbarViewController.swift
//  Project
//
//  Created by Jairo on 04/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class TabbarViewController: UITabBarController {
    var detailPark = ParkModel()
    static var _shared : TabbarViewController!
    static var shared : TabbarViewController{
        return _shared
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TabbarViewController._shared = self
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        GeneralService.arrayIdsOfActivititesLiked = UserDefaults.activitiesThatUSerLike
        if UserDefaults.userInfo.name == nil{
           UserDefaults.setIsUserRegistered(.login)
        }
        
        tabBar.barTintColor = UIColor.white
        tabBar.tintColor = GeneralService.primaryColor
//        UserDefaults.setUserInfo(UserModel())
//        UserDefaults.setIsUserRegistered(.login)
        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
