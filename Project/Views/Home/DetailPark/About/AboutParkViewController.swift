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
    
    var deatilPark = ParkModel()
    var mapView = GMSMapView()
    
    let informationTextView: UITextView = {
        let txt = UITextView()
        txt.isSelectable = false
        txt.isEditable = false
        txt.isScrollEnabled = false
        
        return txt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topImage.image = UIImage(named: deatilPark.img)
        self.setInformationPark()
        
        self.addSubviews(methodOfSubViews: { self.addMyViews() })
        // Do any additional setup after loading the view.
    }
    
    func setInformationPark(){
        let attrString = NSMutableAttributedString()
        
        attrString.appendWith(color: #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1), ofSize: UIFont.boldSystemFont(ofSize: 23), text: deatilPark.name)
        attrString.appendWith(color: #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1), ofSize: UIFont.systemFont(ofSize: 18), text: "\n\(deatilPark.slogan)")
        attrString.appendWith(color: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), ofSize: UIFont.systemFont(ofSize: 18), text: "\n\n\(deatilPark.schedule)")
        attrString.appendWith(color: #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 0.8440443065), ofSize: UIFont.systemFont(ofSize: 18), text: "\n\n\(deatilPark.desc)")
        
        self.informationTextView.attributedText = attrString
        
        
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
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
