//
//  DetailViewController.swift
//  Xcaret
//
//  Created by Jairo on 03/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import UIKit

enum segueViews{
    case detailPark
    case activity
}

protocol ChangeViewsProtocol: class {
    func changeViewsProtocol(identifier: segueViews)
}

class DetailViewController: GenericScrollViewController, ChangeViewsProtocol  {
    var deatilPark = ParkModel()
    let detailBtn = Button.borderButton()
    let buyNow = Button.normalButton()
    let labelTheNew = UILabel()
    let labelTheNew2 = UILabel()
    var collection: GenericRoundCollectionView!
    var ovalCollection: SemiOvalGenericCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topImage.image = UIImage(named: deatilPark.img)
        self.addSubviews(methodOfSubViews: { self.addMyViews() })
        collection.items = deatilPark.category.first!.activities
        ovalCollection.items = deatilPark.category.first!.activities
        collection.reloadData()
        ovalCollection.reloadData()
        
        detailBtn.setTitle("Acerca de \(deatilPark.name)", for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @objc func showMeDetailView(){
        guard UserDefaults.isUserRegistered else{
            print("Necesita registrarse")
//            TabbarViewController.shared.showModalNeedLoginView()
            self.changeViewsProtocol(identifier: .detailPark)
            return
        }
    }
    
    func changeViewsProtocol(identifier: segueViews) {
        switch identifier {
        case .detailPark:
            let vc = AboutParkViewController()
            vc.deatilPark = self.deatilPark
            self.navigationController?.pushViewController(vc, animated: true)
            print("Va al detalle del parque")
            break
        case.activity:
            let vc = AcitivtyViewController()
//            vc.deatilPark = self.deatilPark
            self.navigationController?.pushViewController(vc, animated: true)
            print("Va al detalle de la actividad")
            break
        }
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
