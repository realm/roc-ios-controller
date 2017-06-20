//
//  ServerSetupViewController.swift
//  ROCController
//
//  Created by Maximilian Alexander on 6/15/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import RealmSwift
import Eureka

class ServerSetupViewController: FormViewController {
    
    
    static let SERVER_URL = "SERVER_URL"
    static let USERNAME = "USERNAME"
    static let PASSWORD = "PASSWORD"
    static let CONFIRM = "CONFIRM"
    
    lazy var confirmButton: ButtonRow = {
        let row = ButtonRow(ServerSetupViewController.CONFIRM) { row in
            row.title = "Login"
        }
        return row
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Connect to Realm Object Server"
        
        form +++ Section()
            <<< TextRow(ServerSetupViewController.SERVER_URL) { row in
                row.title = "ROS URL:"
                row.placeholder = "Your http or https auth endpoint"
            }
            <<< TextRow(ServerSetupViewController.USERNAME) { row in
                row.title = "Username:"
                row.cell.textField.autocorrectionType = .no
                row.cell.textField.autocapitalizationType = .none
            }.onChange({ (row) in
                UserDefaults.standard.cachedUsername = row.value
            })
            <<< PasswordRow(ServerSetupViewController.PASSWORD) { row in
                row.title = "Password:"
                row.cell.textField.autocorrectionType = .no
                row.cell.textField.autocapitalizationType = .none
            }
            +++ Section()
            <<< confirmButton
                .onCellSelection({ [weak self] (_, _) in
                    guard let `self` = self else { return }
                    let url = self.form.values()[ServerSetupViewController.SERVER_URL] as? String ?? ""
                    let username = self.form.values()[ServerSetupViewController.USERNAME] as? String ?? ""
                    let password = self.form.values()[ServerSetupViewController.PASSWORD] as? String ?? ""
                    let authURL = URL(string: url.replacingOccurrences(of: "realm://", with: "http://"))!
                    self.attemptAuth(authUrl: authURL, username: username, password: password, isRegister: false)
                })
        
        form.setValues([
            ServerSetupViewController.SERVER_URL: "http://45.55.173.122:9080",
            ServerSetupViewController.USERNAME: UserDefaults.standard.cachedUsername
        ])
        
    }
    
    func attemptAuth(authUrl: URL, username: String, password: String, isRegister: Bool) {
        confirmButton.title = "One Moment..."
        confirmButton.disabled = Condition(booleanLiteral: true)
        confirmButton.evaluateDisabled()
        
        let creds = SyncCredentials.usernamePassword(username: username, password: password, register: isRegister)
        SyncUser.logIn(with: creds, server: authUrl) { [weak self] (user, error) in
            DispatchQueue.main.async {
                if let _ = user {
                    self?.navigationController?.setViewControllers([ChatHomeViewController()], animated: true)
                }else {
                    if isRegister == false {
                        self?.confirmButton.title = "Creating a New User..."
                        self?.attemptAuth(authUrl: authUrl, username: username, password: password, isRegister: true)
                    }else {
                        self?.confirmButton.title = "Login"
                        self?.confirmButton.disabled = Condition(booleanLiteral: false)
                        self?.confirmButton.evaluateDisabled()
                        
                        let alert = UIAlertController(title: "Uh Oh", message: "We ran into an error...\(error?.localizedDescription ?? "")", preferredStyle: .alert)
                        
                        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
                        
                        self?.present(alert, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    
}
