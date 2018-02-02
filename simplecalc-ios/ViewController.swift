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
    var count: Double = 0
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
        count = 0
    }
    
    @IBAction func operand(_ sender: UIButton) {
        if(sender.titleLabel!.text! == "MOD") {
            operand = "%"
        } else {
            operand = sender.titleLabel!.text!
        }
        runningTotal += Double(outputDisplay.text!)!
        displayNumber = ""
    }
    
    @IBAction func multiOperand(_ sender: UIButton) {
        operand = sender.titleLabel!.text!
        switch operand {
        case "COUNT":
            count += 1
        case "AVG":
            runningTotal += Double(outputDisplay.text!)!
            count += 1
        case "FACT":
            for number in 0...(Int(outputDisplay.text!)! - 1) {
                if(runningTotal == 0) {
                    runningTotal = Double(outputDisplay.text!)! - Double(number)
                } else {
                    runningTotal = runningTotal * (Double(outputDisplay.text!)! - Double(number))
                    print(runningTotal)
                }
            }
            
            outputDisplay.text = String(runningTotal)
            print(runningTotal)
        default:
            break
        }
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
        case "%":
            outputDisplay.text = String(runningTotal.truncatingRemainder(dividingBy: Double(outputDisplay.text!)!))
        case "COUNT":
            outputDisplay.text = String(count + 1)
        case "AVG":
            outputDisplay.text = String((runningTotal + Double(outputDisplay.text!)!) / (count + 1))
        default:
            outputDisplay.text = "Error"
        }
        
        runningTotal = 0
        count = 0
    }
}

