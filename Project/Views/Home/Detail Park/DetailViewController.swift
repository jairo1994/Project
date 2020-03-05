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
    func showAboutPark()
    func showActivityDetail(id: Int)
}

class DetailViewController: GenericScrollViewController, ChangeViewsProtocol  {
    var detailPark = ParkModel()
    let detailBtn = Button.borderButton()
    let buyNow = Button.normalButton()
    let labelTheNew = UILabel()
    let labelTheNew2 = UILabel()
    var collection: GenericRoundCollectionView!
    var ovalCollection: SemiOvalGenericCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topImage.image = UIImage(named: detailPark.img)
        self.addSubviews(methodOfSubViews: { self.addMyViews() })
        collection.items = detailPark.category.first!.activities
        ovalCollection.items = detailPark.category.first!.activities
        collection.reloadData()
        ovalCollection.reloadData()
        
        detailBtn.setTitle("Acerca de \(detailPark.name)", for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @objc func buyNowAction(){
        guard UserDefaults.isUserRegistered == .registered else{
            print("Necesita registrarse")
            TabbarViewController.shared.showModalNeedLoginView()
            return
        }
        
        self.navigationController?.pushViewController(BookViewController(), animated: true)
    }
    
    @objc func showMeDetailView(){
        self.showAboutPark()
    }
    
    func showAboutPark() {
        let vc = AboutParkViewController()
        vc.detailPark = self.detailPark
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showActivityDetail(id: Int){
        self.detailPark.getSpecificActivityBy(id: id, Callback: { (activity, subtitle) in
            let vc = AcitivtyViewController()
            vc.detailActivity = activity
            vc.subtitle = subtitle
            self.navigationController?.pushViewController(vc, animated: true)
        })
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
