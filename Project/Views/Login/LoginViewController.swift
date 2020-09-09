//
//  LoginViewController.swift
//  Project
//
//  Created by Jairo on 04/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import UIKit
import TextFieldEffects

class LoginViewController: UIViewController {
    var user = UserModel(name: "Angelica", lastname: "Can Canche", country: "México", provincia: "QRoo", telmovil: "998 1451632", mail: "acan@xcaret.com", password: "xcaret-2020")
    @IBOutlet weak var txtMail: KaedeTextField!
    @IBOutlet weak var txtPassword: KaedeTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtMail.placeholderColor = GeneralService.primaryColor
        txtPassword.placeholderColor = GeneralService.primaryColor
        // Do any additional setup after loading the view.
    }

    @IBAction func login(_ sender: Any) {
        //MARK: En esta función habrá una petición al servicor para autenticarse, en caso de loggearse correctamente se guarda en user defaults y le permite al usuario continuar con la compra del servicio
        
        
        let mail = txtMail.text!
        let password = txtPassword.text!
        
        guard mail.trimmingCharacters(in: .whitespaces).count > 0, password.trimmingCharacters(in: .whitespaces).count > 0 else{
            Alerts.showAlert(title: "Ups", subtitle: "Por favor, ingrese ambos campos para continuar", type: .warning)
            return
        }
        
        guard mail == "", password == "" else{
            Alerts.showAlert(title: "Ups", subtitle: "Su usuario o contraseña son incorrectos", type: .danger)
            return
        }
        
        Alerts.showAlert(title: "Listo!", subtitle: "Bienvenido(a) \(self.user.name!) \(self.user.lastname!)", type: .success)
        self.finishedProcess(user: self.user, state: .registered)
    }
    
    func finishedProcess(user: UserModel, state: userState){
        UserDefaults.setUserInfo(user)
        UserDefaults.setIsUserRegistered(state)
        self.postChange()
    }
    
    @IBAction func guest(_ sender: Any) {
        Alerts.showAlert(title: "Listo!", subtitle: "Bienvenido(a)", type: .success)
        self.finishedProcess(user: UserModel(), state: .guest)
    }
    
    @IBAction func register(_ sender: Any) {
        UserDefaults.setIsUserRegistered(.register)
        self.postChange()
    }
    
    @IBAction func rememberPassword(_ sender: Any) {
        UserDefaults.setIsUserRegistered(.remember)
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
