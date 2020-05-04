//
//  LeavingCert.swift
//  Leaving Cert Points Calculator
//
//  Created by Adam Herrmann on 31/07/2017.
//  Copyright © 2017 Adam Herrmann. All rights reserved.
//

import Foundation

class LeavingCert {
    
    var points_array = [Int]()
    var label_array = [String]()
    
    func add_subject(points: Int, label: String) -> Int {
        points_array.append(points)
        label_array.append(label)
        return get_total_points()
    }
    
    func get_total_points() -> Int {
        
        var total_points = 0
        var max_subjects = 6
        
        let combined = zip(points_array, label_array).sorted {$0.0 > $1.0}
        
        points_array = combined.map {$0.0}
        label_array = combined.map {$0.1}
        
        for points in points_array {
            total_points = total_points + points
            max_subjects = max_subjects - 1
            if (max_subjects < 1) {
                break
            }
        }
        return total_points
    }
    
    func addMathsBonus() -> Int
    {
        return get_total_points()
    }
    
    func reset() -> Int
    {
        points_array = [Int]()
        label_array = [String]()
        return get_total_points()
    }
    
    func get_subject_count() -> Int
    {
        return points_array.count
    }
}
