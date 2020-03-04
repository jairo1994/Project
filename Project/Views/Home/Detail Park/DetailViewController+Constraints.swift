//
//  DetailViewController+Constraints.swift
//  Xcaret
//
//  Created by Jairo on 03/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import Foundation
import UIKit

extension DetailViewController{
    func addMyViews(){
        
        self.scrollView.addSubview(buyNow)
        buyNow.setTitle("COMPRAR AHORA", for: .normal)
        buyNow.addTarget(self, action: #selector(showMeDetailView), for: .touchUpInside)
        
        self.scrollView.addSubview(labelTheNew)
        labelTheNew.translatesAutoresizingMaskIntoConstraints = false
        labelTheNew.textColor = GeneralService.primaryColor
        labelTheNew.text = "Resorts nuevos"
        labelTheNew.font = UIFont.boldSystemFont(ofSize: 23)
        
        self.scrollView.addSubview(detailBtn)
        detailBtn.translatesAutoresizingMaskIntoConstraints = false
        detailBtn.backgroundColor = GeneralService.primaryColor
        detailBtn.tintColor = .white
        detailBtn.setTitle("Showme the resort", for: .normal)
        detailBtn.addTarget(self, action: #selector(showMeDetailView), for: .touchUpInside)
        
        self.addMyConstraints()
        self.view.layoutIfNeeded()
        self.view.setNeedsUpdateConstraints()
    }
    
    func addMyConstraints(){
        buyNow.centerXAnchor.constraint(equalTo: curvedView.centerXAnchor).isActive = true
        buyNow.centerYAnchor.constraint(equalTo: curvedView.topAnchor, constant: 32).isActive = true
        buyNow.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        labelTheNew.topAnchor.constraint(equalTo: topImage.bottomAnchor).isActive = true
        labelTheNew.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        labelTheNew.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        detailBtn.topAnchor.constraint(equalTo: labelTheNew.bottomAnchor, constant: 8).isActive = true
        detailBtn.centerXAnchor.constraint(equalTo: topImage.centerXAnchor).isActive = true
        detailBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

}
