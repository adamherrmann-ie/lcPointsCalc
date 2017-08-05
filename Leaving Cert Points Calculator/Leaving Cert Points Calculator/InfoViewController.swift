//
//  InfoViewController.swift
//  Leaving Cert Points Calculator
//
//  Created by Adam Herrmann on 05/08/2017.
//  Copyright © 2017 Adam Herrmann. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var higherLabel: UILabel!
    @IBOutlet weak var ordinaryLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        percentageLabel.textColor = UIColor.white
        higherLabel.textColor = UIColor.white
        ordinaryLabel.textColor = UIColor.white
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func dismissButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
