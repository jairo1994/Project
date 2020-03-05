//
//  AcitivtyViewController.swift
//  Project
//
//  Created by Jairo on 04/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import UIKit

class AcitivtyViewController: GenericScrollViewController {
    
    var detailActivity = ActivityModel()
    var subtitle = ""
    let btnMap: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "map-position"), for: .normal)
        btn.tintColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        return btn
    }()
    let scheduleInfo = Button.normalButton()
    let btnLike = UIButton(type: .system)
    var userLikeThisActivity = false
    var indexLiked = 0
    var includedLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 18)
        return lbl
    }()
    let informationTextView: UITextView = {
        let txt = UITextView()
        txt.isSelectable = false
        txt.isEditable = false
        txt.isScrollEnabled = false
        
        return txt
    }()
    
    let descriptionTextView: UITextView = {
        let txt = UITextView()
        txt.isSelectable = false
        txt.isEditable = false
        txt.isScrollEnabled = false
        
        return txt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateHeartButton()
        btnLike.tintColor = .red
        btnLike.addTarget(self, action: #selector(addActivity), for: .touchUpInside)
        
        includedLabel.textColor = detailActivity.itHasAdditionalCost ? .red : #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        includedLabel.text = detailActivity.itHasAdditionalCost ? "Con costo adicional" : "Incluido en tu entrada"
        
        scheduleInfo.setTitle(detailActivity.horario, for: .normal)
        scheduleInfo.isUserInteractionEnabled = false
        
        topImage.image = UIImage(named: detailActivity.img)
        self.setInformationPark()
        self.addSubviews(methodOfSubViews: { self.addMyViews() })
        // Do any additional setup after loading the view.
    }
    
    func updateHeartButton(){
        if let index = GeneralService.arrayIdsOfActivititesLiked.first(where: {$0.idActivity == self.detailActivity.id}){
            self.indexLiked = index.idActivity
        }else{
            self.indexLiked = 0
        }
        btnLike.setImage(UIImage(named: self.indexLiked != 0 ? "heart" : "heart-outline"), for: .normal)
    }
    
    @objc func addActivity(){
        if self.indexLiked != 0{
            if let indexToRemove = GeneralService.arrayIdsOfActivititesLiked.firstIndex(where: {$0.idActivity == self.detailActivity.id}){
                GeneralService.arrayIdsOfActivititesLiked.remove(at: indexToRemove)
                UserDefaults.setAllActivitiesThatUserLike(GeneralService.arrayIdsOfActivititesLiked)
            }
        }else{
            UserDefaults.addActivityThatUserLike(activitySaved(idPark: TabbarViewController._shared.detailPark.idPark, idActivity: self.detailActivity.id))
            GeneralService.arrayIdsOfActivititesLiked = UserDefaults.activitiesThatUSerLike
        }
        
        self.updateHeartButton()
    }
    
    func setInformationPark(){
        let attrString = NSMutableAttributedString()
        attrString.appendWith(color: #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1), ofSize: UIFont.boldSystemFont(ofSize: 23), text: detailActivity.name)
        attrString.appendWith(color: #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1), ofSize: UIFont.systemFont(ofSize: 18), text: "\n\(subtitle)")
        self.informationTextView.attributedText = attrString
        
        
        let attrString2 = NSMutableAttributedString()
        attrString2.appendWith(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), ofSize: UIFont.systemFont(ofSize: 17), text: detailActivity.desc)
        self.descriptionTextView.attributedText = attrString2
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
