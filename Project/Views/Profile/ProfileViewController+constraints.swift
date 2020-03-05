//
//  ProfileViewController+constraints.swift
//  Project
//
//  Created by Jairo on 05/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import Foundation
import UIKit

extension ProfileViewController{
    func addMyViews(){
        self.scrollView.addSubview(backViewAvatar)
        backViewAvatar.translatesAutoresizingMaskIntoConstraints = false
        
        self.scrollView.addSubview(avatarImage)
        avatarImage.image = UIImage(named: "man")
        // avatarImage.image = UIImage(named: "woman")
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        
        self.scrollView.addSubview(tableOptions)
        tableOptions.translatesAutoresizingMaskIntoConstraints = false
        
        self.addMyConstraints()
    }
    
    func addMyConstraints(){
        avatarImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 32).isActive = true
        avatarImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        avatarImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35).isActive = true
        avatarImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35).isActive = true
        
        backViewAvatar.centerXAnchor.constraint(equalTo: avatarImage.centerXAnchor).isActive = true
        backViewAvatar.centerYAnchor.constraint(equalTo: avatarImage.centerYAnchor).isActive = true
        backViewAvatar.widthAnchor.constraint(equalTo: avatarImage.widthAnchor, multiplier: 1.4).isActive = true
        backViewAvatar.heightAnchor.constraint(equalTo: avatarImage.heightAnchor, multiplier: 1.4).isActive = true
        
        tableOptions.topAnchor.constraint(equalTo: curvedView.topAnchor, constant: 60).isActive = true
        tableOptions.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableOptions.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableOptions.heightAnchor.constraint(equalToConstant: CGFloat(options.count*100)).isActive = true
        
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "Womble the first component is the alpha not the last one. So#ff00ff00 has alpha 1 because of the ff at the beginning."
        scrollView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: tableOptions.bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableOptions.dequeueReusableCell(withIdentifier: optionsIdentifier, for: indexPath) as? ProfileOptionsTableViewCell
        
        cell!.configureCell(option: self.options[indexPath.item], index: indexPath.item)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.optionHasPressed(option: self.options[indexPath.item].action)
    }
    
    
}
