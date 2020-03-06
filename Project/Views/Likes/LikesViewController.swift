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
    var idPark = 0
    var imageInfoNotSaved: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "error")
        
        return img
    }()
    var labelInfoNotSaved = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        labelInfoNotSaved.text = "Aun no tiene actividades guardads en favoritos"
        labelInfoNotSaved.numberOfLines = 0
        tableViewActivitiesLiked.delegate = self
        tableViewActivitiesLiked.dataSource = self
        tableViewActivitiesLiked.register(UINib(nibName: likedCellidentifier, bundle: nil), forCellReuseIdentifier: likedCellidentifier)
        
        idPark = TabbarViewController._shared.detailPark.idPark
        topImage.image = UIImage(named: TabbarViewController._shared.detailPark.img)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.findLikedActivities()
    }
    
    func findLikedActivities(){
        
        activitiesLiked = [ActivityModel]()
        GeneralService.arrayIdsOfActivititesLiked.forEach({ (activity) in
            
            if let park = GeneralService.parks.first(where: {$0.idPark == idPark})?.category.first(where: { $0.id == activity.idCategory})?.activities.first(where: { $0.id == activity.idActivity}){
                activitiesLiked.append(park)
            }
        })
        
        self.scrollView.removeFromSuperview()
        self.addSubviews(methodOfSubViews: { self.addMyViews() })
        tableViewActivitiesLiked.reloadData()
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
