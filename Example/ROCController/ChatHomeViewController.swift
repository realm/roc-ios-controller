//
//  ChatHomeViewController.swift
//  ROCController
//
//  Created by Maximilian Alexander on 6/19/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import RealmSwift

class ChatHomeViewController: UITabBarController, RecipientSelectorViewControllerDelegate {
    
    
    lazy var newBarButtonItem: UIBarButtonItem = {
        let newImage = UIImage(named: "new_chat_icon")?.withRenderingMode(.alwaysTemplate)
        let b = UIBarButtonItem(image: newImage, style: .plain, target: nil, action: nil)
        b.tintColor = SampleAppConstants.Colors.primaryColor
        return b
    }()
    
    lazy var logoutBarButtonItem: UIBarButtonItem = {
        let b = UIBarButtonItem(title: "Logout", style: .plain, target: nil, action: nil)
        b.tintColor = SampleAppConstants.Colors.primaryColor
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Realm Sync Chat"
        
        navigationItem.rightBarButtonItem = newBarButtonItem
        navigationItem.leftBarButtonItem = logoutBarButtonItem
    
        logoutBarButtonItem.target = self
        logoutBarButtonItem.action = #selector(ChatHomeViewController.attemptLogout)
        
        newBarButtonItem.target = self
        newBarButtonItem.action = #selector(ChatHomeViewController.presentRecipientSelector)
        
    }
    
    func presentRecipientSelector(){
        let recipientSelector = RecipientSelectorViewController()
        recipientSelector.delegate = self
        let navigationController = UINavigationController(rootViewController:recipientSelector)
        present(navigationController, animated: true, completion: nil)
    }

    func attemptLogout(){
        let alert = UIAlertController(title: "Logout?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes, Logout", style: .destructive, handler: { [weak self] (_) in
            guard let `self` = self else { return }
            SyncUser.current?.logOut()
            self.navigationController?.setViewControllers([WelcomeViewController()], animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // RecipientSelectorViewControllerDelegate
    func didSelectUserIds(userIds: [String]) {
        
    }
    
}
