//
//  LeavingCert.swift
//  Leaving Cert Points Calculator
//
//  Created by Adam Herrmann on 31/07/2017.
//  Copyright © 2017 Adam Herrmann. All rights reserved.
//

import Foundation

class LeavingCert {
    
    var points_array = [0]
    
    func addSubject(points: Int) -> Int {
        points_array.append(points)
        return getTotalPoints()
    }
    
    func getTotalPoints() -> Int {
        
        var total_points = 0
        var max_subjects = 6
        
        points_array = points_array.sorted { $0 > $1 }  // Sort array
        
        for points in points_array {
            total_points = total_points + points
            max_subjects = max_subjects - 1
            if (max_subjects < 1) {
                break
            }
        }
        
        return total_points
    }
    
    func addMathsBonus() -> Int {
        
        return getTotalPoints()
    }
    
    func reset() -> Int {
        
        points_array = [0]
        
        return getTotalPoints()
    }
}
