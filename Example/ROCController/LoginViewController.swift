//
//  LoginViewController.swift
//  ROCController
//
//  Created by Maximilian Alexander on 6/15/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import RealmSwift
import Eureka

class LoginSetupViewController: UIViewController {
    
    lazy var usernameTextField: UITextField = {
        let t = UITextField()
        t.placeholder = "username"
        t.layer.cornerRadius = 4
        t.layer.borderColor = UIColor.gray.cgColor
        t.layer.borderWidth = 1
        t.textAlignment = .center
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    lazy var passwordTextField: UITextField = {
        let t = UITextField()
        t.placeholder = "password"
        t.layer.cornerRadius = 4
        t.layer.borderColor = UIColor.gray.cgColor
        t.layer.borderWidth = 1
        t.textAlignment = .center
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    lazy var goButton: UIButton = {
        let b = UIButton()
        b.setTitle("Login or Register!", for: .normal)
        b.backgroundColor = SampleAppConstants.Colors.primaryColor
        b.setTitleColor(.white, for: .normal)
        b.layer.borderColor = SampleAppConstants.Colors.primaryColor.cgColor
        b.layer.borderWidth = 2
        b.layer.cornerRadius = 1
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    let realmUrl: String
    
    var authUrl: String {
        return realmUrl.replacingOccurrences(of: "realm://", with: "http://")
    }
    
    init(realmUrl: String){
        self.realmUrl = realmUrl
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(goButton)
        
        title = "Let's Login to \(realmUrl)"
        
        let views: [String: Any] = [
            "usernameTextField": usernameTextField,
            "passwordTextField": passwordTextField,
            "goButton": goButton
        ]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[usernameTextField]-16-|", options: [], metrics: nil, views: views))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[passwordTextField]-16-|", options: [], metrics: nil, views: views))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[goButton]-16-|", options: [], metrics: nil, views: views))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[usernameTextField(50)]-8-[passwordTextField(50)]-8-[goButton(50)]", options: [], metrics: nil, views: views))
        
    }
    
    func setGoButtonState(isLoading: Bool){
        if isLoading {
            goButton.isEnabled = false
            goButton.setTitle("One Moment...", for: .disabled)
        }else {
            goButton.isEnabled = true
            goButton.setTitle("Login Or Register", for: .normal)
        }
    }
    
    func goButtonDidTap(){
        let usernameCredentials = SyncCredentials.usernamePassword(username: self.usernameTextField.text ?? "", password: self.passwordTextField.text ?? "")
        SyncUser.logIn(with: usernameCredentials, server: URL(string: authUrl)!) { (user, error) in
            
        }
    }
    
}
