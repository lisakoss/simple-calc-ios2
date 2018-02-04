//
//  HistoryViewController.swift
//  simplecalc-ios
//
//  Created by Lisa Koss on 2/3/18.
//  Copyright © 2018 Lisa Koss. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var history: [String] = []
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let historyView = segue.destination as! ViewController
        historyView.history = history
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height)
        scrollView.isScrollEnabled = true
        scrollView.sizeToFit()
        
        var offset = 0
        for operation in history {
            let label = UILabel()
            label.text = operation
            label.textColor = UIColor.white
            label.frame = CGRect(x: 0, y: offset, width: 50, height: 50)
            label.sizeToFit()
            scrollView.addSubview(label)
            offset = offset + 50
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
