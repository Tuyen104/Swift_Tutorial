//
//  CommentsViewController.swift
//  DemoTableView
//
//  Created by Toof on 4/3/19.
//  Copyright © 2019 Toof. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        let nib = UINib(nibName: "CommentsTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "CommentsTableViewCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationItem.title = "Manage Comments"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_back")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backButtonPressed(_:)))
    }
    
    @objc
    fileprivate
    func backButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
}

extension CommentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsTableViewCell") as! CommentsTableViewCell
        return cell
    }
}

extension CommentsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
