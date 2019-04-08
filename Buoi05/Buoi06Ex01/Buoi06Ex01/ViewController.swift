//
//  ViewController.swift
//  Buoi06Ex01
//
//  Created by Le Tuyen on 3/26/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tuyenLabel : UILabel!
    @IBOutlet var nameTextField : UITextField!
    @IBOutlet var addButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func addButtonPressed(_ sender: UIButton){
        if let name = self.nameTextField.text{
            self.tuyenLabel.text = "Hello \(name)"
        }
    }

}

