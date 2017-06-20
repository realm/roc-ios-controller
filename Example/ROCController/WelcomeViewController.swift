//
//  WelcomeViewController.swift
//  ROCController
//
//  Created by Maximilian Alexander on 3/20/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import RealmSwift

class WelcomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let options = [
        "Minimal Example",
        "Realm Mobile Platform Example"
    ]
    
    lazy var tableView: UITableView = {
        let t = UITableView()
        t.delegate = self
        t.dataSource = self
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Realm Object Chat!"
        view.addSubview(tableView)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableView]-0-|", options: [], metrics: nil, views: [
                "tableView": tableView
            ]))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[tableView]-0-|", options: [], metrics: nil, views: [
            "tableView": tableView
        ]))
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let conversations = ConversationsViewController()
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            navigationController?.pushViewController(conversations, animated: true)
            break
        case 1:
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            if SyncUser.current != nil {
                let home = ChatHomeViewController()
                navigationController?.pushViewController(home, animated: true)
            }else {
                let setup = ServerSetupViewController()
                navigationController?.pushViewController(setup, animated: true)
            }
            
            break
        default:
            break;
        }
    }
    
}
