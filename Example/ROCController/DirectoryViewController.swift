//
//  DirectoryViewController.swift
//  ROCController
//
//  Created by Maximilian Alexander on 6/21/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import RealmSwift

class DirectoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    lazy var tableView: UITableView = {
        let t = UITableView()
        t.register(RecipientTableViewCell.self, forCellReuseIdentifier: RecipientTableViewCell.REUSED_ID)
        t.rowHeight = RecipientTableViewCell.HEIGHT
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    var notificationToken: NotificationToken? = nil
    let users: Results<User> = User.globalUsersRealm.objects(User.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        let views: [String: Any] = [
            "tableView": tableView,
            "topLayoutGuide": topLayoutGuide
        ]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableView]-0-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[topLayoutGuide]-0-[tableView]-0-|", options: [], metrics: nil, views: views))
        

        tableView.dataSource = self
        tableView.delegate = self
        
        let realm = try! Realm()
        realm.invalidate()
        
        notificationToken = users.addNotificationBlock { [weak self] (changes: RealmCollectionChange) in
            guard let tableView = self?.tableView else { return }
            switch changes {
            case .initial:
                // Results are now populated and can be accessed without blocking the UI
                tableView.reloadData()
                break
            case .update(_, let deletions, let insertions, let modifications):
                // Query results have changed, so apply them to the UITableView
                tableView.beginUpdates()
                tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                                     with: .automatic)
                tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                tableView.endUpdates()
                break
            case .error(let error):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(error)")
                break
            }
        }
        
    }
    
    deinit {
        notificationToken?.stop()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipientTableViewCell.REUSED_ID, for: indexPath) as! RecipientTableViewCell
        cell.setupWithUser(user: users[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let chatHomeViewController = (parent as? ChatHomeViewController)
        chatHomeViewController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        chatHomeViewController?.navigationController?.pushViewController(UIViewController(), animated: true)
    }
}
