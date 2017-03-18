//
//  ConversationsViewController.swift
//  ROCController
//
//  Created by Maximilian Alexander on 3/17/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import ROCController
import RealmSwift

class ConversationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    lazy var tableView: UITableView = {
        let t = UITableView()
        t.delegate = self
        t.dataSource = self
        t.translatesAutoresizingMaskIntoConstraints = false
        t.register(ConversationTableViewCell.self, forCellReuseIdentifier: ConversationTableViewCell.REUSE_ID)
        return t
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Conversations"
        
        view.addSubview(tableView)
        
        let views: [String: UIView] = [
            "tableView": tableView
        ]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableView]-0-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[tableView]-0-|", options: [], metrics: nil, views: views))
        
        navigationItem.backBarButtonItem = nil
    }
    
    //UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ConversationTableViewCell.HEIGHT
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let realm = try! Realm()
        let results = realm.objects(SampleChatMessage.self).sorted(byKeyPath: "timestamp", ascending: true)
        let chatViewController = SampleChatController(results: results)
        navigationController?.pushViewController(chatViewController, animated: true)
    }
    
}
