//
//  RecipientSelectorViewController.swift
//  ROCController
//
//  Created by Maximilian Alexander on 6/20/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import RealmSwift
import TURecipientBar


class UserRecipient : NSObject, NSCopying, TURecipientProtocol {
    
    public func copy(with zone: NSZone? = nil) -> Any {
        return UserRecipient(user: self.user)
    }
    
    let user: User
    
    var recipientTitle: String
    
    init(user: User){
        self.user = user
        self.recipientTitle = user.name
        super.init()
    }
    
}



protocol RecipientSelectorViewControllerDelegate: class {
    func didSelectUserIds(userIds: [String])
}

class RecipientSelectorViewController: UIViewController, TURecipientsBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    weak var delegate: RecipientSelectorViewControllerDelegate?
    
    lazy var recipientsBar: TURecipientsBar = {
        let r = TURecipientsBar()
        r.translatesAutoresizingMaskIntoConstraints = false
        return r
    }()
    
    lazy var tableView: UITableView = {
        let t = UITableView()
        t.keyboardDismissMode = .interactive
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    lazy var cancelBarButtonItem: UIBarButtonItem = {
        let b = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: nil)
        return b
    }()
    
    lazy var doneBarButtonItem: UIBarButtonItem = {
        let b = UIBarButtonItem(title: "Chat!", style: .plain, target: nil, action: nil)
        return b
    }()
    
    var results: Results<User>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(recipientsBar)
        view.addSubview(tableView)
        
        title = "Select Users"
        
        let views: [String: Any] = [
            "recipientsBar": recipientsBar,
            "tableView": tableView,
            "topLayoutGuide": topLayoutGuide
        ]
        
        navigationItem.leftBarButtonItem = cancelBarButtonItem
        
        cancelBarButtonItem.target = self
        cancelBarButtonItem.action = #selector(RecipientSelectorViewController.cancel)
        
        doneBarButtonItem.target = self
        doneBarButtonItem.action = #selector(RecipientSelectorViewController.done)
        
        recipientsBar.showsAddButton = false
        recipientsBar.recipientsBarDelegate = self
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[recipientsBar]-0-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableView]-0-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[topLayoutGuide]-0-[recipientsBar(>=40)]-0-[tableView]-0-|", options: [], metrics: nil, views: views))
        
        tableView.register(RecipientTableViewCell.self, forCellReuseIdentifier: RecipientTableViewCell.REUSED_ID)
        tableView.rowHeight = RecipientTableViewCell.HEIGHT
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        recipientsBar.becomeFirstResponder()
    }
    
    func evaluateDoneButtonVisibility(){
        let isEnabled = recipientsBar.recipients.count > 0
        navigationItem.rightBarButtonItem = isEnabled ? doneBarButtonItem : nil
    }
    
    func cancel(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func done(){
        var setOfUserIds = Set<String>(
            (self.recipientsBar.recipients as! [UserRecipient]).map({ $0.user._id })
        )
        //make sure we include ourselves
        setOfUserIds.insert(SyncUser.current!.identity!)
        self.dismiss(animated: true) {
            self.delegate?.didSelectUserIds(userIds: Array(setOfUserIds))
        }
        
    }
    
    // TURecipientsBarDelegate
    
    func recipientsBar(_ recipientsBar: TURecipientsBar, textDidChange searchText: String?) {
        guard let searchText = searchText else {
            self.results = nil
            return
        }
        self.results = User.searchForUsers(searchTerm: searchText)
        tableView.reloadData()
    }
    
    func recipientsBarReturnButtonClicked(_ recipientsBar: TURecipientsBar) {
        guard let user = self.results?.first else { return }
        attemptToAdd(user: user)
    }
    
    // UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let user = results?[indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipientTableViewCell.REUSED_ID, for: indexPath) as! RecipientTableViewCell
        cell.setupWithUser(user: user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let user = self.results?[indexPath.row] else { return }
        attemptToAdd(user: user)
    }
    
    func attemptToAdd(user: User){
        let contains = (recipientsBar.recipients as! [UserRecipient]).contains { (userRecipient) -> Bool in
            return userRecipient.user._id == user._id
        }
        if(contains) {
            return
        }
        recipientsBar.addRecipient(UserRecipient(user: user))
        recipientsBar.text = nil
        evaluateDoneButtonVisibility()
    }

    func attemptToRemove(userId: String){
        for recipent in (recipientsBar.recipients as! [UserRecipient]) {
            if (recipent.user._id == userId) {
                recipientsBar.removeRecipient(recipent)
            }
        }
        evaluateDoneButtonVisibility()
    }
    
    
}
