//
//  ProfileEditViewController.swift
//  ROCController
//
//  Created by Maximilian Alexander on 6/21/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import Eureka


class ProfileEditViewController: FormViewController {
    
    static let NAME = "USERNAME"
    static let EMAIL = "EMAIL"
    static let CONFIRM = "CONFIRM"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form
            +++ Section()
            <<< TextRow(ProfileEditViewController.NAME) { row in
                row.title = "Name:"
            }
            <<< TextRow(ProfileEditViewController.EMAIL) { row in
                row.title = "Email:"
            }
            +++ Section()
            <<< ButtonRow(ProfileEditViewController.CONFIRM) { row in
                row.title = "Save Profile"
            }.onCellSelection({ [weak self] (_, _) in
                self?.attemptSave()
            })
        
        form.setValues([
            ProfileEditViewController.NAME: User.getMe().name,
            ProfileEditViewController.EMAIL: User.getMe().email
        ])
        
    }
    
    func attemptSave(){
        let me = User.getMe()
        let newName = form.values()[ProfileEditViewController.NAME] as! String
        let newEmail = form.values()[ProfileEditViewController.EMAIL] as! String
        User.upsertUserInfo(username: me.username, name: newName, email: newEmail)
        
        let alert = UIAlertController(title: "Information Saved!", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
