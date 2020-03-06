//
//  RegisterViewController.swift
//  Project
//
//  Created by Jairo on 04/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import UIKit
import TextFieldEffects


class RegisterViewController: UIViewController {

    @IBOutlet weak var name: JiroTextField!
    @IBOutlet weak var lastname: JiroTextField!
    @IBOutlet weak var country: JiroTextField!
    @IBOutlet weak var state: JiroTextField!
    @IBOutlet weak var phone: JiroTextField!
    @IBOutlet weak var mail: JiroTextField!
    @IBOutlet weak var password: JiroTextField!
    @IBOutlet weak var confirmPassword: JiroTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.placeholderColor = GeneralService.primaryColor
        lastname.placeholderColor = GeneralService.primaryColor
        country.placeholderColor = GeneralService.primaryColor
        state.placeholderColor = GeneralService.primaryColor
        phone.placeholderColor = GeneralService.primaryColor
        mail.placeholderColor = GeneralService.primaryColor
        password.placeholderColor = GeneralService.primaryColor
        confirmPassword.placeholderColor = GeneralService.primaryColor
        
        // Do any additional setup after loading the view.
    }

    @IBAction func goBack(_ sender: Any) {
        UserDefaults.setIsUserRegistered(.login)
        NotificationCenter.default.post(name: NSNotification.Name("statusUserHasChanged"), object: nil)
    }
    
    @IBAction func register(_ sender: Any) {
        let textname = self.name.text
        let textlastname = self.lastname.text!.trimmingCharacters(in: .whitespaces)
        let textcountry = self.country.text!.trimmingCharacters(in: .whitespaces)
        let textstate = self.state.text!.trimmingCharacters(in: .whitespaces)
        let textphone = self.phone.text!.trimmingCharacters(in: .whitespaces)
        let textmail = self.mail.text!.trimmingCharacters(in: .whitespaces)
        let textpassword = self.password.text!.trimmingCharacters(in: .whitespaces)
        let textconfirmPassword = self.confirmPassword.text!.trimmingCharacters(in: .whitespaces)
        
        guard validateForm(textname: textname!, textlastname: textlastname, textcountry: textcountry, textstate: textstate, textphone: textphone, textmail: textmail, textpassword: textpassword, textconfirmPassword: textconfirmPassword) else {
            return
        }
        
        UserDefaults.setUserInfo(UserModel(name: textname, lastname: textlastname, country: textcountry, provincia: textstate, telmovil: textphone, mail: textmail, password: textpassword))
        UserDefaults.setIsUserRegistered(.registered)
        NotificationCenter.default.post(name: NSNotification.Name("statusUserHasChanged"), object: nil)
        
    }
   
    
    func validateForm(textname: String, textlastname: String, textcountry: String, textstate: String, textphone: String, textmail: String, textpassword: String, textconfirmPassword: String)->Bool{
        
        name.placeholderColor = textname.count > 0 ? GeneralService.primaryColor : .red
        lastname.placeholderColor = textlastname.count > 0 ? GeneralService.primaryColor : .red
        country.placeholderColor = textcountry.count > 0 ? GeneralService.primaryColor : .red
        state.placeholderColor = textstate.count > 0 ? GeneralService.primaryColor : .red
        phone.placeholderColor = textphone.count > 0 ? GeneralService.primaryColor : .red
        mail.placeholderColor = textmail.count > 0 ? GeneralService.primaryColor : .red
        password.placeholderColor = textpassword.count > 0 ? GeneralService.primaryColor : .red
        confirmPassword.placeholderColor = textconfirmPassword.count > 0 ? GeneralService.primaryColor : .red
        
        guard textname.count > 0, textlastname.count > 0, textcountry.count > 0, textstate.count > 0, textphone.count > 0, textmail.count > 0, textpassword.count > 0, textconfirmPassword.count > 0 else{
            Alerts.showAlert(title: "Ups", subtitle: "Ingrese todos los datos para continuar con su registro", type: .warning)
            return false
        }
        
        guard textpassword == textconfirmPassword else{
            Alerts.showAlert(title: "Ups", subtitle: "Las contraseñas ingresadas son diferentes", type: .warning)
            return false
        }
        
        return true
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
