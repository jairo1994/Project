//
//  AboutParkViewController.swift
//  Xcaret
//
//  Created by Jairo on 03/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import UIKit
import GoogleMaps

class AboutParkViewController: GenericScrollViewController {
    
    var detailPark = ParkModel()
    var mapView = GMSMapView()
    
    let labelAddress: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.numberOfLines = 0
        lbl.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return lbl
    }()
     
    let included: UIButton = {
        let lbl = UIButton(type: .system)
        lbl.titleLabel!.font = UIFont.systemFont(ofSize: 20)
        lbl.tintColor = GeneralService.primaryColor
        lbl.setTitle("¿Qué incluye?", for: .normal)
        lbl.addTarget(self, action: #selector(includedInfo), for: .touchUpInside)
        return lbl
    }()
    
    let recomendations: UIButton = {
        let lbl = UIButton(type: .system)
        lbl.titleLabel!.font = UIFont.systemFont(ofSize: 20)
        lbl.tintColor = GeneralService.primaryColor
        lbl.setTitle("Recomendaciones", for: .normal)
        lbl.addTarget(self, action: #selector(recomendationInfo), for: .touchUpInside)
        return lbl
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = GeneralService.primaryColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let includedTextView: UITextView = {
        let txt = UITextView()
        txt.isSelectable = false
        txt.isEditable = false
        txt.isScrollEnabled = false
        
        return txt
    }()
    
    let informationTextView: UITextView = {
        let txt = UITextView()
        txt.isSelectable = false
        txt.isEditable = false
        txt.isScrollEnabled = false
        
        return txt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelAddress.text = detailPark.address
        topImage.image = UIImage(named: detailPark.img)
        
        self.setInformationPark()
        self.addSubviews(methodOfSubViews: { self.addMyViews() })
        self.includedInfo()
        // Do any additional setup after loading the view.
    }
    
    func setInformationPark(){
        let attrString = NSMutableAttributedString()
        
        attrString.appendWith(color: #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1), ofSize: UIFont.boldSystemFont(ofSize: 23), text: detailPark.name)
        attrString.appendWith(color: #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1), ofSize: UIFont.systemFont(ofSize: 18), text: "\n\(detailPark.slogan)")
        attrString.appendWith(color: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), ofSize: UIFont.systemFont(ofSize: 18), text: "\n\n\(detailPark.schedule)")
        attrString.appendWith(color: #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 0.8440443065), ofSize: UIFont.systemFont(ofSize: 18), text: "\n\n\(detailPark.desc)")
        
        self.informationTextView.attributedText = attrString
        
        let camera = GMSCameraPosition.camera(withLatitude: detailPark.latitude, longitude: detailPark.longitude, zoom: 15.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: detailPark.latitude, longitude: detailPark.latitude)
        marker.map = mapView
    }
    
    @objc func recomendationInfo(){
        let attrString2 = NSMutableAttributedString()
        for i in 0..<self.detailPark.recomendations.count{
            attrString2.appendWith(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), ofSize: UIFont.systemFont(ofSize: 18), text: " - \(self.detailPark.recomendations[i])\n")
        }
        self.includedTextView.attributedText = attrString2
        self.lineView.removeFromSuperview()
        scrollView.addSubview(lineView)
        lineView.leadingAnchor.constraint(equalTo: recomendations.leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: recomendations.trailingAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 3).isActive = true
        lineView.topAnchor.constraint(equalTo: recomendations.bottomAnchor, constant: 4).isActive = true
    }
    
    @objc func includedInfo(){
        let attrString2 = NSMutableAttributedString()
        for i in 0..<self.detailPark.included.count{
            attrString2.appendWith(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), ofSize: UIFont.systemFont(ofSize: 18), text: " - \(self.detailPark.included[i])\n")
        }
        self.includedTextView.attributedText = attrString2
        self.lineView.removeFromSuperview()
        scrollView.addSubview(lineView)
        lineView.leadingAnchor.constraint(equalTo: included.leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: included.trailingAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 3).isActive = true
        lineView.topAnchor.constraint(equalTo: included.bottomAnchor, constant: 4).isActive = true
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
