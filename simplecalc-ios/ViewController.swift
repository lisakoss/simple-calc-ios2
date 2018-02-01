//
//  ViewController.swift
//  simplecalc-ios
//
//  Created by Lisa Koss on 1/31/18.
//  Copyright © 2018 Lisa Koss. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnPress(_ sender: UIButton) {
        
        if(sender.titleLabel!.text == "0") {
            print("yay")
        } else {
            print("not zero")
        }
    }
}

