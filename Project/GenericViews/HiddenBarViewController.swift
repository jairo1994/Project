//
//  HiddenBarViewController.swift
//  helper
//
//  Created by Jairo on 04/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import UIKit

class HiddenBarViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let navbar = navigationController{
            navbar.navigationBar.isHidden = true
            navbar.navigationBar.setBackgroundImage(nil, for: .default)
            navbar.navigationBar.shadowImage = nil
        }
    }
    
}
