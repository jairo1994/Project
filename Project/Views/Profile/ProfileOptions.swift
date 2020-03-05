//
//  ProfileOptions.swift
//  Project
//
//  Created by Jairo on 05/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import Foundation
import UIKit

struct ProfileOptionModel{
    var titleLabel : String!
    var description : String!
    var image: UIImage!
    var profileOptionType : ProfileOptionType!
    var action: actionFromOption
}

enum ProfileOptionType: Int{
    case Idioma
    case Edit
    case Logout
}

enum actionFromOption: Int{
    case changeLanguage
    case editProfile
    case rateUs
    case writeUs
    case callUs
    case logOut
}

class ProfileOption{
    static func getProfileOptions(withOutPrecheckin: Bool = false)->[ProfileOptionModel]{
        var profileOptions = [ProfileOptionModel]()
        
        profileOptions.append(ProfileOptionModel(titleLabel: "Idioma", description: "Pulse sobre esta opción si desea cambiar el idioma de la app.", image: #imageLiteral(resourceName: "idioma"), profileOptionType: .Idioma, action: .changeLanguage))
        
        profileOptions.append(ProfileOptionModel(titleLabel: "Editar Perfil", description: "Edite la información de su cuenta: correo electrónico, contraseña ó numero telefónico.", image: #imageLiteral(resourceName: "edit"), profileOptionType: .Edit, action: .editProfile))
        
        profileOptions.append(ProfileOptionModel(titleLabel: "Califica nuestra app", description: "Comentanos que te ha parecido la app.", image: #imageLiteral(resourceName: "star"), profileOptionType: .Edit, action: .rateUs))
        
        profileOptions.append(ProfileOptionModel(titleLabel: "Escribenos", description: "Si tienes dudas, comentarios, sugerencias envianos un correo.", image: #imageLiteral(resourceName: "mail"), profileOptionType: .Edit, action: .writeUs))
        
        profileOptions.append(ProfileOptionModel(titleLabel: "Llamanos", description: "Necesitas asistencias llamanos.", image: #imageLiteral(resourceName: "tel"), profileOptionType: .Edit, action: .callUs))
        
        profileOptions.append(ProfileOptionModel(titleLabel: "Cerrar sesión", description: "Al cerrar sesión se eliminará la información del usuario en el dispositivo.", image: #imageLiteral(resourceName: "logout"), profileOptionType: .Edit, action: .logOut))
        
        return profileOptions
    }
}

