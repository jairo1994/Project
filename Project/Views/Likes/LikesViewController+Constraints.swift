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
        if GeneralService.arrayIdsOfActivititesLiked.count > 0{
            self.scrollView.addSubview(tableViewActivitiesLiked)
            tableViewActivitiesLiked.translatesAutoresizingMaskIntoConstraints = false
        }else{
            self.scrollView.addSubview(imageInfoNotSaved)
            imageInfoNotSaved.translatesAutoresizingMaskIntoConstraints = false
            
            self.scrollView.addSubview(labelInfoNotSaved)
            labelInfoNotSaved.translatesAutoresizingMaskIntoConstraints = false
         
        }
        self.addMyConstraints()
    }
    
    func addMyConstraints(){
        if GeneralService.arrayIdsOfActivititesLiked.count > 0{
            tableViewActivitiesLiked.topAnchor.constraint(equalTo: curvedView.topAnchor, constant: 60).isActive = true
            tableViewActivitiesLiked.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            tableViewActivitiesLiked.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            tableViewActivitiesLiked.heightAnchor.constraint(equalToConstant: CGFloat(GeneralService.arrayIdsOfActivititesLiked.count*90)).isActive = true
        }else{
            imageInfoNotSaved.topAnchor.constraint(equalTo: curvedView.topAnchor, constant: 60).isActive = true
            imageInfoNotSaved.centerXAnchor.constraint(equalTo: curvedView.centerXAnchor).isActive = true
            imageInfoNotSaved.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
            imageInfoNotSaved.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
            
            labelInfoNotSaved.topAnchor.constraint(equalTo: imageInfoNotSaved.topAnchor, constant: 8).isActive = true
            labelInfoNotSaved.centerXAnchor.constraint(equalTo: imageInfoNotSaved.centerXAnchor).isActive = true
        }
    }
}

extension LikesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activitiesLiked.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewActivitiesLiked.dequeueReusableCell(withIdentifier: likedCellidentifier, for: indexPath) as? ActivityLikedTableViewCell else { return UITableViewCell() }
        cell.name.text = self.activitiesLiked[indexPath.item].name
        cell.category.text = self.activitiesLiked[indexPath.item].name
        cell.isIncluded.text = self.activitiesLiked[indexPath.item].itHasAdditionalCost ? "Con costo adicional" : "Incluido en tu entrada"
        cell.imagePark.image = UIImage(named: self.activitiesLiked[indexPath.item].img)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
