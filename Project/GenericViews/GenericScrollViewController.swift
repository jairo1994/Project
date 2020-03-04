//
//  GenericScrollViewController.swift
//  Xcaret
//
//  Created by Jairo on 04/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import UIKit

class GenericScrollViewController: HiddenBarViewController, UIScrollViewDelegate {
    let scrollView = UIScrollView()
    let topHelperView = UIView()
    let curvedView = ArcView()
    let topImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    func addSubviews(methodOfSubViews: @escaping (() -> Void)){
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        
        scrollView.addSubview(topHelperView)
        topHelperView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(topImage)
        topImage.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(curvedView)
        curvedView.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 0)
        curvedView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints()
        methodOfSubViews()
        self.view.layoutIfNeeded()
        self.view.setNeedsUpdateConstraints()
    }
    
    func addConstraints(){
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        topHelperView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        topHelperView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topHelperView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topHelperView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        
        //Se crea el objeto avplayer para reproducir el video
        let topAnchor = self.topImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        topAnchor.priority = .defaultHigh
        topAnchor.isActive = true
        let heightAnchor = self.topImage.heightAnchor.constraint(greaterThanOrEqualTo: topHelperView.heightAnchor, constant: 0)
        heightAnchor.priority = .required
        heightAnchor.isActive = true
        self.topImage.leadingAnchor.constraint(equalTo: topHelperView.leadingAnchor).isActive = true
        self.topImage.trailingAnchor.constraint(equalTo: topHelperView.trailingAnchor).isActive = true
        self.topImage.bottomAnchor.constraint(equalTo: topHelperView.bottomAnchor).isActive = true
        
        
        curvedView.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: -80).isActive = true
        curvedView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        curvedView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        curvedView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.8).isActive = true
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !showBar{
            show()
        }else{
            hide()
        }
    }
    
    private var showBar : Bool{
        let frame = curvedView.convert(curvedView.bounds, to: nil)
        guard let navbar = navigationController else{
            return false
        }
        let frameenterprise = navbar.navigationBar.convert((navbar.navigationBar.bounds), to: nil)
        return frame.minY < frameenterprise.maxY
    }
    
    
    func show(){
        if super.isViewLoaded {
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
            self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
        if let navbar = navigationController{
            navbar.navigationBar.isHidden = false
            navbar.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navbar.navigationBar.shadowImage = UIImage()
            navbar.navigationBar.isTranslucent = true
        }
    }
    
    func hide(){
        if let navbar = navigationController{
            navbar.interactivePopGestureRecognizer?.isEnabled = false
            navbar.navigationBar.setBackgroundImage(UIImage(named: "green"), for: .default)
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
