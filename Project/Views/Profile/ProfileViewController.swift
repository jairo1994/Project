//
//  ProfileViewController.swift
//  Project
//
//  Created by Jairo on 05/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import UIKit

class ProfileViewController: GenericScrollViewController {
    var avatarImage = UIImageView()
    var tableOptions = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        topImage.image = UIImage(named: "green")
        self.addSubviews(methodOfSubViews: { self.addMyViews() })
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
