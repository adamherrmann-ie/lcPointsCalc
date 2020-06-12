//
//  InfoViewController.swift
//  Leaving Cert Points Calculator
//
//  Created by Adam Herrmann on 05/08/2017.
//  Copyright © 2017 Adam Herrmann. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var percentage_label: UILabel!
    @IBOutlet weak var higher_label: UILabel!
    @IBOutlet weak var ordinary_label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
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
