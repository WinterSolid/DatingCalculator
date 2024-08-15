//
//  Zone.swift
//  DatingCalculator
//
//  Created by ZakTank on 8/14/24.
//

import UIKit

struct Zone {
    let imageName: String
    let description: String
    
    var image: UIImage? {
        return UIImage(named: imageName)
    }
}
