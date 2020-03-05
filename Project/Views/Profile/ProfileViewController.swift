//
//  ProfileViewController.swift
//  Project
//
//  Created by Jairo on 05/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import UIKit


class ProfileViewController: GenericScrollViewController {
    let optionsIdentifier = "ProfileOptionsTableViewCell"
    var avatarImage = UIImageView()
    var backViewAvatar: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        view.layer.borderWidth = 3
        return view
    }()
    var tableOptions = UITableView()
    let options = ProfileOption.getProfileOptions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableOptions.delegate = self
        tableOptions.dataSource = self
        tableOptions.register(UINib(nibName: optionsIdentifier, bundle: nil), forCellReuseIdentifier: optionsIdentifier)
        
        topImage.image = UIImage(named: "green")
        self.addSubviews(methodOfSubViews: { self.addMyViews() })
        backViewAvatar.layer.cornerRadius = backViewAvatar.frame.width / 2
        // Do any additional setup after loading the view.
    }
    
    func logout(alert: UIAlertAction!) {
        UserDefaults.setUserInfo(UserModel())
        UserDefaults.setIsUserRegistered(.login)
        NotificationCenter.default.post(name: NSNotification.Name("statusUserHasChanged"), object: nil)
    }
    
    func optionHasPressed(option: actionFromOption){
        var title = "Opcion presionada"
        var message = ""
        
        switch option {
        case .changeLanguage:
            message = "Esta opción se encargaría de ayudar a cambiar el idioma"
            break
        case .editProfile:
            message = "Esta opción se encargaría de mostrar la vista para editar el perfil"
            break
        case .rateUs:
            message = "Esta opción se encargaría de dar la opción de calificar la app en la tienda"
            break
        case .writeUs:
            message = "Esta opción se encargaría de mandar la vista a la app de correo"
            break
        case .callUs:
            message = "Esta opción se encargaría de lanzar la app de telefono y llamar al numero que se le indique"
            break
        case .logOut:
            title = "¿Desea continuar?"
            message = "Sus datos serán elminados de la app"
            break
            
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if option == .logOut{
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: logout))
            alert.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: nil))
        }else{
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        }
        
        self.present(alert, animated: true)
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
