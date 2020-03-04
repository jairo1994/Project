//
//  LoginViewController.swift
//  Project
//
//  Created by Jairo on 04/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func login(_ sender: Any) {
        self.dismiss(animated: true) {
            print("Cerrado")
        }
    }
    
    @IBAction func register(_ sender: Any) {
        UserState.status = .register
        self.postChange()
    }
    
    @IBAction func guest(_ sender: Any) {
        
    }
    
    @IBAction func rememberPassword(_ sender: Any) {
        UserState.status = .remember
        self.postChange()
    }
    
    func postChange(){
        NotificationCenter.default.post(name: NSNotification.Name("statusUserHasChanged"), object: nil)
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
