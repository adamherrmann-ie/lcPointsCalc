//
//  ViewController.swift
//  Leaving Cert Points Calculator
//
//  Created by Adam Herrmann on 27/07/2017.
//  Copyright © 2017 Adam Herrmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var total_points = 0
    var hl_flag = true
    
    let leaving_cert = LeavingCert()
    
    @IBOutlet weak var points_label: UILabel!
    
    @IBOutlet weak var h1_button: UIButton!
    @IBOutlet weak var h2_button: UIButton!
    @IBOutlet weak var h3_button: UIButton!
    @IBOutlet weak var h4_button: UIButton!
    @IBOutlet weak var h5_button: UIButton!
    @IBOutlet weak var h6_button: UIButton!
    @IBOutlet weak var h7_button: UIButton!
    @IBOutlet weak var h8_button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPress(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            if hl_flag {
                total_points = leaving_cert.addSubject(points: 100)
            } else {
                total_points = leaving_cert.addSubject(points: 56)
            }
        case 2:
            if hl_flag {
                total_points = leaving_cert.addSubject(points: 88)
            } else {
                total_points = leaving_cert.addSubject(points: 46)
            }
        case 3:
            if hl_flag {
                total_points = leaving_cert.addSubject(points: 77)
            } else {
                total_points = leaving_cert.addSubject(points: 37)
            }
        case 4:
            if hl_flag {
                total_points = leaving_cert.addSubject(points: 66)
            } else {
                total_points = leaving_cert.addSubject(points: 28)
            }
        case 5:
            if hl_flag {
                total_points = leaving_cert.addSubject(points: 56)
            } else {
                total_points = leaving_cert.addSubject(points: 20)
            }
        case 6:
            if hl_flag {
                total_points = leaving_cert.addSubject(points: 46)
            } else {
                total_points = leaving_cert.addSubject(points: 12)

            }
        case 7:
            if hl_flag {
                total_points = leaving_cert.addSubject(points: 37)

            } else {
                total_points = leaving_cert.addSubject(points: 0)

            }
        case 8:
            if hl_flag {
                total_points = leaving_cert.addSubject(points: 0)

            } else {
                total_points = leaving_cert.addSubject(points: 0)

            }
        case 20: // Switch level
            if hl_flag {
                hl_flag = false
                h1_button.setTitle("O1", for: .normal)
                h2_button.setTitle("O2", for: .normal)
                h3_button.setTitle("O3", for: .normal)
                h4_button.setTitle("O4", for: .normal)
                h5_button.setTitle("O5", for: .normal)
                h6_button.setTitle("O6", for: .normal)
                h7_button.setTitle("O7", for: .normal)
                h8_button.setTitle("O8", for: .normal)
                
            } else {
                hl_flag = true
                h1_button.setTitle("H1", for: .normal)
                h2_button.setTitle("H2", for: .normal)
                h3_button.setTitle("H3", for: .normal)
                h4_button.setTitle("H4", for: .normal)
                h5_button.setTitle("H5", for: .normal)
                h6_button.setTitle("H6", for: .normal)
                h7_button.setTitle("H7", for: .normal)
                h8_button.setTitle("H8", for: .normal)
            }
        case 25:        // Add maths bonus points
            total_points = leaving_cert.addMathsBonus()
        case 10:        // Reset
            total_points = leaving_cert.reset()
        case 11:        // Pass
            total_points = leaving_cert.addSubject(points: 28)
        case 12:        // Merit
            total_points = leaving_cert.addSubject(points: 46)
        case 13:        // Distinction
            total_points = leaving_cert.addSubject(points: 66)
        default:
            total_points = 0
        }
        points_label.text = String(total_points)
    }
    
    func addValue(points: Int) {
        
    }
    


}

