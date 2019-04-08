//
//  ViewController.swift
//  Buoi05Ex02
//
//  Created by Le Tuyen on 3/26/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var userNameTextField : UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton : UIButton!
    let myColor = UIColor.darkGray
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       userNameTextField.layer.borderColor = myColor.cgColor
        passwordTextField.layer.borderColor = myColor.cgColor
        userNameTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderWidth = 1.0
        userNameTextField.layer.opacity = 0.5
        passwordTextField.layer.opacity = 0.5
        userNameTextField.leftView = UIView(frame: CGRect(x:0,y:0,width:15,height:self.userNameTextField.frame.height))
        userNameTextField.leftViewMode = .always
        passwordTextField.leftView = UIView(frame: CGRect(x:0,y:0,width:15,height:self.passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        
        borderShadow(bt: loginButton)
    }
    func borderShadow(bt:UIButton){
        bt.layer.shadowColor = myColor.cgColor
        bt.layer.shadowOffset = CGSize()
        bt.layer.shadowOpacity = 1
        bt.layer.shadowRadius = 4.0
        bt.layer.masksToBounds = false
    }
    //presentation
    @IBAction func tabButton(_ sender: UIButton){
        let abc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"Layout2ViewController")
        self.present(abc, animated: true, completion: nil)
    }

}

