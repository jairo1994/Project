//
//  LikesViewController+Constraints.swift
//  Project
//
//  Created by Jairo on 05/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import Foundation
import UIKit

extension LikesViewController{
    
    func addMyViews(){
        
        self.scrollView.addSubview(tableViewActivitiesLiked)
        tableViewActivitiesLiked.translatesAutoresizingMaskIntoConstraints = false
        self.addMyConstraints()
    }
    
    func addMyConstraints(){
        tableViewActivitiesLiked.topAnchor.constraint(equalTo: curvedView.topAnchor, constant: 60).isActive = true
        tableViewActivitiesLiked.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableViewActivitiesLiked.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableViewActivitiesLiked.heightAnchor.constraint(equalToConstant: CGFloat(GeneralService.arrayIdsOfActivititesLiked.count*90)).isActive = true
    }
}

extension LikesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activitiesLiked.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewActivitiesLiked.dequeueReusableCell(withIdentifier: likedCellidentifier, for: indexPath) as? ActivityLikedTableViewCell
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
