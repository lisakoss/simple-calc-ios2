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
    
    var operand = ""
    var runningTotal: Double = 0
    var displayNumber = ""
    @IBOutlet weak var outputDisplay: UILabel!
    
    @IBAction func updateDisplay(_ sender: UIButton) {
        displayNumber += sender.titleLabel!.text!
        outputDisplay.text = displayNumber
    }
    
    @IBAction func clearDisplay(_ sender: UIButton) {
        outputDisplay.text = "0"
        displayNumber = ""
        runningTotal = 0
    }
    
    
    @IBAction func operand(_ sender: UIButton) {
        operand = sender.titleLabel!.text!
        runningTotal += Double(outputDisplay.text!)!
        displayNumber = ""
    }
    
    @IBAction func total(_ sender: UIButton) {
        switch operand {
        case "+":
            outputDisplay.text = String(runningTotal + Double(outputDisplay.text!)!)
        case "-":
            outputDisplay.text = String(runningTotal - Double(outputDisplay.text!)!)
        case "×":
            outputDisplay.text = String(runningTotal * Double(outputDisplay.text!)!)
        case "÷":
            outputDisplay.text = String(runningTotal / Double(outputDisplay.text!)!)
        default:
            outputDisplay.text = "Error"
        }
        
        runningTotal = 0
    }
}

