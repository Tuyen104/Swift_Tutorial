//
//  ViewController.swift
//  PraticeLayout
//
//  Created by Le Tuyen on 4/1/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var username: UITextField!
    @IBOutlet var password : UITextField!
    @IBOutlet var login : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func navigateToCal(_ sender: UIButton){
        let calculator = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CalculatorViewController")
        self.present(calculator, animated: true, completion: nil)
    }

}

