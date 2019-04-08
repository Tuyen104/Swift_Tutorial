//
//  TopChartsViewController.swift
//  TableViewDemo02
//
//  Created by Le Tuyen on 4/6/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import UIKit

class TopChartsViewController: UIViewController {
    
    @IBOutlet weak var productTableView : UITableView!
    private var leftBarButton: UIBarButtonItem!
    private var leftBarButtonTitle: UIBarButtonItem!
    private var rightBarButtonTitle : UIBarButtonItem!
    let backgroundColorBtn = UIColor(red:0.00, green:0.48, blue:1.00, alpha:1.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Top Charts"
        self.navigationItem.titleView = UIView()
        
        self.productTableView.dataSource = self
        self.productTableView.delegate = self
        let nib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        self.productTableView.register(nib, forCellReuseIdentifier: "ProductTableViewCell")
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.leftBarButton = UIBarButtonItem(image: UIImage(named: "ic_backArrow"), style: .plain, target: self, action: #selector(backButtonPressed(_:)))
        self.leftBarButtonTitle = UIBarButtonItem.init(title: "Games", style: .plain, target: self, action: #selector(backButtonPressed(_:)))
        self.rightBarButtonTitle = UIBarButtonItem.init(title: "All Games", style: .plain, target: self, action: #selector(backButtonPressed(_:)))
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "Games", style: .plain, target: self, action: #selector(backButtonPressed(_:)))
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_backArrow"), style: .plain, target: self, action: #selector(backButtonPressed(_:)))
        self.navigationItem.leftBarButtonItems = [self.leftBarButton, self.leftBarButtonTitle]
        self.navigationItem.rightBarButtonItem = rightBarButtonTitle
    }
    @objc fileprivate func backButtonPressed(_ sender : UIBarButtonItem){
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension TopChartsViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension TopChartsViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as! ProductTableViewCell
        return cell 
    }
    
    
}
