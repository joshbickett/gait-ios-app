//
//  ProfileFilter.swift
//  Gait
//
//  Created by Joshua Bickett on 4/18/20.
//  Copyright © 2020 Joshua Bickett. All rights reserved.
//

import Foundation


enum ProfileFilter {
    case overall, year, month, week, day
    
    func toString() -> String {
        
        var strFilter = ""

        
        switch self {
        case .overall:
            strFilter = "overall"
        case .year:
            strFilter = "year"
        case .month:
            strFilter = "month"
        case .week:
            strFilter = "week"
        case .day:
            strFilter = "day"
        default:
            strFilter = "overall"
        }
        
        return strFilter

    }
}
