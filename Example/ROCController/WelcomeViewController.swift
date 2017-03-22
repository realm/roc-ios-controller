//
//  WelcomeViewController.swift
//  ROCController
//
//  Created by Maximilian Alexander on 3/20/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let options = [
        "Standard"
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
    
}
