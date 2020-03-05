//
//  MainLoginViewController.swift
//  Project
//
//  Created by Jairo on 04/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import UIKit

class MainLoginViewController: UIViewController {
    
    var isWorkingAsModal = false
    private lazy var loginVC: LoginViewController = {
        var viewController = LoginViewController()
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    private lazy var registerVC: RegisterViewController = {
        var viewController = RegisterViewController()
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    private lazy var rememberVC: RememberPasswordViewController = {
        var viewController = RememberPasswordViewController()
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    private lazy var profileVC: ProfileViewController = {
        var viewController = ProfileViewController()
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.statusUserHasChanged()
        NotificationCenter.default.addObserver(self, selector: #selector(statusUserHasChanged), name: NSNotification.Name("statusUserHasChanged"), object: nil)
        // Do any additional setup after loading the view.
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
    @objc func statusUserHasChanged() {
        remove(asChildViewController: loginVC)
        remove(asChildViewController: registerVC)
        remove(asChildViewController: rememberVC)
        remove(asChildViewController: profileVC)
        
        if (UserDefaults.isUserRegistered == .registered || UserDefaults.isUserRegistered == .guest) && isWorkingAsModal{
            self.dismiss(animated: true) {
                NotificationCenter.default.post(name: NSNotification.Name("userCanBook"), object: nil)
            }
        }else{
            switch UserDefaults.isUserRegistered {
            case .login:
                add(asChildViewController: loginVC)
                break
            case .remember:
                add(asChildViewController: rememberVC)
                break
            case .register:
                add(asChildViewController: registerVC)
                break
            case .registered, .guest:
                add(asChildViewController: profileVC)
                break
            }
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
