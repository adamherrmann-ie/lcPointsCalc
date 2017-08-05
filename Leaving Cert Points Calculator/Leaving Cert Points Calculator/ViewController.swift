//
//  ViewController.swift
//  Leaving Cert Points Calculator
//
//  Created by Adam Herrmann on 27/07/2017.
//  Copyright © 2017 Adam Herrmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var total_points = 0
    var hl_flag = true
    var lcvp_flag = false
    var hl_maths_flag = false
    var hl_maths_added = false
    let my_blue = UIColor(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
    
    let leaving_cert = LeavingCert()
    
    @IBOutlet weak var points_label: UILabel!
    
    @IBOutlet weak var subjectsListTable: UITableView!
    
    
    
    @IBOutlet weak var h1_button: UIButton!
    @IBOutlet weak var h2_button: UIButton!
    @IBOutlet weak var h3_button: UIButton!
    @IBOutlet weak var h4_button: UIButton!
    @IBOutlet weak var h5_button: UIButton!
    @IBOutlet weak var h6_button: UIButton!
    @IBOutlet weak var h7_button: UIButton!
    @IBOutlet weak var h8_button: UIButton!
    @IBOutlet weak var higher_button: UIButton!
    @IBOutlet weak var ordinary_button: UIButton!
    @IBOutlet weak var hl_maths_button: UIButton!
    @IBOutlet weak var distinction_button: UIButton!
    @IBOutlet weak var merit_button: UIButton!
    @IBOutlet weak var pass_button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        higher_button.isEnabled = false
        higher_button.setTitleColor(UIColor.darkGray, for: .normal)
        UIApplication.shared.statusBarStyle = .lightContent
        subjectsListTable.backgroundColor = UIColor.black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaving_cert.points_array.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = leaving_cert.label_array[indexPath.row]
        cell.backgroundColor = UIColor.black
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            if (leaving_cert.label_array[indexPath.row].contains("LCVP")) {
                toggleLCVP()
            } else if (leaving_cert.label_array[indexPath.row].contains("Maths Bonus")) {
                toggleHLMaths()
            }
            leaving_cert.points_array.remove(at: indexPath.row)
            leaving_cert.label_array.remove(at: indexPath.row)
            subjectsListTable.reloadData()
            total_points = leaving_cert.getTotalPoints()
            points_label.text = String(total_points)
            
        }
    }
    
    @IBAction func buttonPress(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            if hl_flag {
                if hl_maths_flag {
                    total_points = leaving_cert.addSubject(points: 125, label: "H1 + Maths Bonus: 125")
                    toggleHLMaths()
                } else {
                    total_points = leaving_cert.addSubject(points: 100, label: "H1: 100")
                }
            } else {
                total_points = leaving_cert.addSubject(points: 56, label: "O1: 56")
            }
        case 2:
            if hl_flag {
                if hl_maths_flag {
                    total_points = leaving_cert.addSubject(points: 113, label: "H2 + Maths Bonus: 113")
                    toggleHLMaths()
                } else {
                    total_points = leaving_cert.addSubject(points: 88, label: "H2: 88")
                }
            } else {
                total_points = leaving_cert.addSubject(points: 46, label: "O2: 46")
            }
        case 3:
            if hl_flag {
                if hl_maths_flag {
                    total_points = leaving_cert.addSubject(points: 102, label: "H3 + Maths Bonus: 102")
                    toggleHLMaths()
                } else {
                    total_points = leaving_cert.addSubject(points: 77, label: "H3: 77")
                }
            } else {
                total_points = leaving_cert.addSubject(points: 37, label: "O3: 37")
            }
        case 4:
            if hl_flag {
                if hl_maths_flag {
                    total_points = leaving_cert.addSubject(points: 91, label: "H4 + Maths Bonus: 91")
                    toggleHLMaths()
                } else {
                    total_points = leaving_cert.addSubject(points: 66, label: "H4: 66")
                }
            } else {
                total_points = leaving_cert.addSubject(points: 28, label: "O4: 28")
            }
        case 5:
            if hl_flag {
                if hl_maths_flag {
                    total_points = leaving_cert.addSubject(points: 81, label: "H5 + Maths Bonus: 81")
                    toggleHLMaths()
                } else {
                    total_points = leaving_cert.addSubject(points: 56, label: "H5: 56")
                }
            } else {
                total_points = leaving_cert.addSubject(points: 20, label: "O5: 20")
            }
        case 6:
            if hl_flag {
                if hl_maths_flag {
                    total_points = leaving_cert.addSubject(points: 71, label: "H6 + Maths Bonus: 71")
                    toggleHLMaths()
                } else {
                    total_points = leaving_cert.addSubject(points: 46, label: "H6: 46")
                }
            } else {
                total_points = leaving_cert.addSubject(points: 12, label: "O6: 12")

            }
        case 7:
            if hl_flag {
                total_points = leaving_cert.addSubject(points: 37, label: "H7: 37")
            } else {
                total_points = leaving_cert.addSubject(points: 0, label: "O7: 0")

            }
        case 8:
            if hl_flag {
                total_points = leaving_cert.addSubject(points: 0, label: "H8: 0")

            } else {
                total_points = leaving_cert.addSubject(points: 0, label: "O8: 0")

            }
        case 20: // Ordinary Level
            
            hl_flag = false
            ordinary_button.isEnabled = false
            higher_button.isEnabled = true
            if !(hl_maths_added) {
                hl_maths_button.isEnabled = true
                hl_maths_button.setTitleColor(my_blue, for: .normal)
                hl_maths_flag = false
            }
            higher_button.setTitleColor(my_blue, for: .normal)
            ordinary_button.setTitleColor(UIColor.darkGray, for: .normal)
            h1_button.setTitle("O1", for: .normal)
            h2_button.setTitle("O2", for: .normal)
            h3_button.setTitle("O3", for: .normal)
            h4_button.setTitle("O4", for: .normal)
            h5_button.setTitle("O5", for: .normal)
            h6_button.setTitle("O6", for: .normal)
            h7_button.setTitle("O7", for: .normal)
            h8_button.setTitle("O8", for: .normal)
        case 25:        // Maths Bonus
            hl_maths_flag = true
            hl_flag = true
            ordinary_button.isEnabled = true
            higher_button.isEnabled = true
            hl_maths_button.isEnabled = false
            higher_button.setTitleColor(my_blue, for: .normal)
            ordinary_button.setTitleColor(my_blue, for: .normal)
            hl_maths_button.setTitleColor(UIColor.darkGray, for: .normal)
            h1_button.setTitle("HM1", for: .normal)
            h2_button.setTitle("HM2", for: .normal)
            h3_button.setTitle("HM3", for: .normal)
            h4_button.setTitle("HM4", for: .normal)
            h5_button.setTitle("HM5", for: .normal)
            h6_button.setTitle("HM6", for: .normal)
            h7_button.setTitle("HM7", for: .normal)
            h8_button.setTitle("HM8", for: .normal)
        case 31:
            hl_flag = true
            if !(hl_maths_added) {
                hl_maths_flag = false
                hl_maths_button.isEnabled = true
                hl_maths_button.setTitleColor(my_blue, for: .normal)
            }
            ordinary_button.isEnabled = true
            higher_button.isEnabled = false
            higher_button.setTitleColor(UIColor.darkGray, for: .normal)
            ordinary_button.setTitleColor(my_blue, for: .normal)
            h1_button.setTitle("H1", for: .normal)
            h2_button.setTitle("H2", for: .normal)
            h3_button.setTitle("H3", for: .normal)
            h4_button.setTitle("H4", for: .normal)
            h5_button.setTitle("H5", for: .normal)
            h6_button.setTitle("H6", for: .normal)
            h7_button.setTitle("H7", for: .normal)
            h8_button.setTitle("H8", for: .normal)
        case 10:        // Reset
            total_points = leaving_cert.reset()
            if lcvp_flag {
                toggleLCVP()
            }
            if hl_maths_added {
                toggleHLMaths()
            }
        case 13:        // Pass
            total_points = leaving_cert.addSubject(points: 28, label: "LCVP Pass: 28")
            toggleLCVP()
        case 12:        // Merit
            total_points = leaving_cert.addSubject(points: 46, label: "LCVP Merit: 46")
            toggleLCVP()
        case 11:        // Distinction
            total_points = leaving_cert.addSubject(points: 66, label: "LCVP Distinction: 66")
            toggleLCVP()
        case 500:
            shareButton()
        default:
            total_points = 0
        }
        points_label.text = String(total_points)
        subjectsListTable.reloadData()
    }
    
    func shareButton() {
        let text_to_share = "I got " + String(total_points) + " in my Leaving Cert!"
        let activity = UIActivityViewController(activityItems: [text_to_share], applicationActivities: nil)
        activity.popoverPresentationController?.sourceView = self.view
        self.present(activity, animated: true, completion: nil)
    }
    
    func toggleLCVP() {
        if (lcvp_flag) {
            lcvp_flag = false
            merit_button.isEnabled = true
            merit_button.setTitleColor(my_blue, for: .normal)
            distinction_button.isEnabled = true
            distinction_button.setTitleColor(my_blue, for: .normal)
            pass_button.isEnabled = true
            pass_button.setTitleColor(my_blue, for: .normal)
        } else {
            lcvp_flag = true
            merit_button.isEnabled = false
            merit_button.setTitleColor(UIColor.darkGray, for: .normal)
            distinction_button.isEnabled = false
            distinction_button.setTitleColor(UIColor.darkGray, for: .normal)
            pass_button.isEnabled = false
            pass_button.setTitleColor(UIColor.darkGray, for: .normal)
        }
        
    }
    
    func toggleHLMaths() {
        if (hl_maths_added) {
            hl_maths_added = false
            hl_maths_button.setTitleColor(my_blue, for: .normal)
            hl_maths_button.isEnabled = true
        } else {
            hl_maths_added = true
            higher_button.sendActions(for: .touchUpInside)
            hl_maths_button.setTitleColor(UIColor.darkGray, for: .normal)
            hl_maths_button.isEnabled = false
        }
    }
    


}

