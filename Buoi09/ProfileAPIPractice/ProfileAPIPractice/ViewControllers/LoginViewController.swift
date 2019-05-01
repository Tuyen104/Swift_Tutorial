//
//  LoginViewController.swift
//  ProfileAPIPractice
//
//  Created by Le Tuyen on 4/24/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userNameLabel : UILabel!
    @IBOutlet weak var loginButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = "kaspercph"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginPressed (_ sender : UIButton){
        let mainVC : MainViewController = MainViewController()
        self.present(mainVC, animated: true, completion: nil)     
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
