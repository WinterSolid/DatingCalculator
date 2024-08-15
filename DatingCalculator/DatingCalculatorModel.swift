//
//  DatingCalculatorModel.swift
//  DatingCalculator
//
//  Created by ZakTan on 8/14/24.
//

import Foundation


import UIKit

func universalHotCrazyMatrixFemale(hot: Int, crazy: Int) -> (UIImage?, String) {
    let result: (UIImage?, String)
    
    switch (hot, crazy) {
    case (let h, let c) where h < 5 && c > 7:
        result = (UIImage(named: "no_go_zone"), "No-Go Zone")
    case (let h, let c) where h >= 5 && h < 8 && c > 5 && c <= 7:
        result = (UIImage(named: "fun_zone"), "Fun Zone")
    case (let h, let c) where h >= 8 && c > 7:
        result = (UIImage(named: "danger_zone"), "Danger Zone")
    case (let h, let c) where h >= 6 && h < 8 && c <= 5:
        result = (UIImage(named: "date_zone"), "Date Zone")
    case (let h, let c) where h >= 8 && c <= 5:
        result = (UIImage(named: "wife_zone"), "Wife Zone")
    default:
        result = (UIImage(named: "undefined_zone"), "Undefined Zone")
    }
    
    return result
}

func universalHotCrazyMatrixmale(hot: Int, crazy: Int) -> (UIImage?, String) {
    let result: (UIImage?, String)
    
    switch (hot, crazy) {
    case (let h, let c) where h < 5 && c > 7:
        result = (UIImage(named: "no_go_zone"), "No-Go Zone")
    case (let h, let c) where h >= 5 && h < 8 && c > 5 && c <= 7:
        result = (UIImage(named: "fun_zone"), "Fun Zone")
    case (let h, let c) where h >= 8 && c > 7:
        result = (UIImage(named: "danger_zone"), "Danger Zone")
    case (let h, let c) where h >= 6 && h < 8 && c <= 5:
        result = (UIImage(named: "date_zone"), "Date Zone")
    case (let h, let c) where h >= 8 && c <= 5:
        result = (UIImage(named: "wife_zone"), "Wife Zone")
    default:
        result = (UIImage(named: "undefined_zone"), "Undefined Zone")
    }
    
    return result
}
