//
//  RememberPasswordViewController.swift
//  Project
//
//  Created by Jairo on 04/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import UIKit
import TextFieldEffects


class RememberPasswordViewController: UIViewController {
    @IBOutlet weak var textfieldMail: JiroTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textfieldMail.placeholderColor = GeneralService.primaryColor
        // Do any additional setup after loading the view.
    }

    @IBAction func goBack(_ sender: Any) {
        UserDefaults.setIsUserRegistered(.login)
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
