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
    
    var history: [String] = []
    var historyString = ""
    var operand = ""
    var runningTotal: Double = 0
    var count: Double = 0
    var displayNumber = ""
    @IBOutlet weak var outputDisplay: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let historyView = segue.destination as! HistoryViewController
        historyView.history = history
    }
    
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
        
        let input = outputDisplay.text!
        historyString = "\(input) \(operand) "
     
        runningTotal += Double(input)!
        displayNumber = ""
    }
    
    @IBAction func multiOperand(_ sender: UIButton) {
        let input = outputDisplay.text!
        operand = sender.titleLabel!.text!
        
        switch operand {
        case "CNT":
            count += 1
        case "AVG":
            runningTotal += Double(input)!
            count += 1
        case "FACT":
            for number in 0...(Int(input)! - 1) {
                if(runningTotal == 0) {
                    runningTotal = Double(input)! - Double(number)
                } else {
                    runningTotal = runningTotal * (Double(input)! - Double(number))
                }
            }
            
            if(String(runningTotal).hasSuffix(".0")) {
                let index: String.Index = String(runningTotal).index(of: ".")!
                outputDisplay.text = String(String(runningTotal)[..<index])
            } else {
                outputDisplay.text = String(runningTotal)
            }
            
        default:
            break
        }
        
        let totalFact = outputDisplay.text
        if(operand == "FACT") {
            historyString = historyString + "\(input) \(operand) = \(totalFact ?? "error")"
        } else {
            historyString = historyString + "\(input) \(operand) "
        }
        
        if(operand == "FACT") {
            history.append(historyString)
            historyString = ""
            runningTotal = 0
        }
        
        displayNumber = ""
    }
    
    @IBAction func total(_ sender: UIButton) {
        var total: String = ""
        let input: String = outputDisplay.text!
        
        switch operand {
        case "+":
            total = String(runningTotal + Double(input)!)
        case "-":
            total = String(runningTotal - Double(input)!)
        case "×":
            total = String(runningTotal * Double(input)!)
        case "÷":
            total = String(runningTotal / Double(input)!)
        case "%":
            total = String(runningTotal.truncatingRemainder(dividingBy: Double(input)!))
        case "CNT":
            total = String(count + 1)
        case "AVG":
            total = String((runningTotal + Double(input)!) / (count + 1))
        default:
            outputDisplay.text = "Error"
        }
        
        if(total.hasSuffix(".0")) {
            let index: String.Index = total.index(of: ".")!
            total = String(total[..<index])
            outputDisplay.text = total
        } else {
            outputDisplay.text = total
        }
        
        historyString = "\(historyString)\(input) = \(total)"
        history.append(historyString)
        historyString = ""
        
        displayNumber = ""
        runningTotal = 0
        count = 0
    }
}

