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
    let detailBtn = UIButton(type: .system)
    let buyNow = UIButton(type: .system)
    let labelTheNew = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topImage.image = UIImage(named: deatilPark.img)
        self.addSubviews(methodOfSubViews: { self.addMyViews() })
        // Do any additional setup after loading the view.
    }
    
    @objc func showMeDetailView(){
        let vc = AboutParkViewController()
        vc.deatilPark = self.deatilPark
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func changeViewsProtocol(identifier: segueViews) {
        switch identifier {
        case .detailPark:
            print("Va al detalle del parque")
            break
        case.activity:
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
