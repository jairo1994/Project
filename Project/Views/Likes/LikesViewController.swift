//
//  LikesViewController.swift
//  Xcaret
//
//  Created by Jairo on 04/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import UIKit

class LikesViewController: GenericScrollViewController {
    
    let likedCellidentifier = "ActivityLikedTableViewCell"
    var tableViewActivitiesLiked = UITableView()
    var activitiesLiked = [ActivityModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewActivitiesLiked.delegate = self
        tableViewActivitiesLiked.dataSource = self
        tableViewActivitiesLiked.register(UINib(nibName: likedCellidentifier, bundle: nil), forCellReuseIdentifier: likedCellidentifier)
        
        GeneralService.parks.
        for i in 0..<GeneralService.arrayIdsOfActivititesLiked.count{
            activitiesLiked =
        }
        topImage.image = UIImage(named: TabbarViewController._shared.detailPark.img)
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
