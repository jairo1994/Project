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
        labelTheNew.text = "Lo más nuevo"
        labelTheNew.font = UIFont.boldSystemFont(ofSize: 23)
        
        collection = (UINib(nibName: "GenericRoundCollectionView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! GenericRoundCollectionView)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegated = self
        self.scrollView.addSubview(collection)
        
        self.scrollView.addSubview(labelTheNew2)
        labelTheNew2.translatesAutoresizingMaskIntoConstraints = false
        labelTheNew2.textColor = GeneralService.primaryColor
        labelTheNew2.text = "Lo que no te debes perder"
        labelTheNew2.font = UIFont.boldSystemFont(ofSize: 23)
        //Actividades Extraordinarias
        
        ovalCollection = (UINib(nibName: "SemiOvalGenericCollectionView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! SemiOvalGenericCollectionView)
        ovalCollection.translatesAutoresizingMaskIntoConstraints = false
        ovalCollection.delegated = self
        self.scrollView.addSubview(ovalCollection)
        
        self.scrollView.addSubview(detailBtn)
        detailBtn.translatesAutoresizingMaskIntoConstraints = false
        detailBtn.backgroundColor = GeneralService.primaryColor
        detailBtn.tintColor = .white
        detailBtn.setTitle("Showme the resort", for: .normal)
        detailBtn.addTarget(self, action: #selector(showMeDetailView), for: .touchUpInside)
        
        self.addMyConstraints()
    }
    
    func addMyConstraints(){
        buyNow.centerXAnchor.constraint(equalTo: curvedView.centerXAnchor).isActive = true
        buyNow.centerYAnchor.constraint(equalTo: curvedView.topAnchor, constant: 32).isActive = true
        buyNow.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        labelTheNew.topAnchor.constraint(equalTo: topImage.bottomAnchor).isActive = true
        labelTheNew.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        labelTheNew.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        collection.topAnchor.constraint(equalTo: labelTheNew.bottomAnchor).isActive = true
        collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        collection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collection.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        
        detailBtn.topAnchor.constraint(equalTo: collection.bottomAnchor, constant: 8).isActive = true
        detailBtn.centerXAnchor.constraint(equalTo: topImage.centerXAnchor).isActive = true
        detailBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        labelTheNew2.topAnchor.constraint(equalTo: detailBtn.bottomAnchor).isActive = true
        labelTheNew2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        labelTheNew2.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        ovalCollection.topAnchor.constraint(equalTo: labelTheNew2.bottomAnchor, constant: 16).isActive = true
        ovalCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        ovalCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        ovalCollection.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3).isActive = true
        
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "Womble the first component is the alpha not the last one. So#ff00ff00 has alpha 1 because of the ff at the beginning."
        scrollView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: ovalCollection.bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }

}
