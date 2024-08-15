//
//  DatingCalculatorVM.swift
//  DatingCalculator
//
//  Created by ZakTank on 8/14/24.
//
import Combine
import UIKit

enum Gender {
    case male
    case female
}

class DatingCalculatorVM: ObservableObject {
    @Published var zone: Zone?
    @Published var hotness: Double = 5
    @Published var craziness: Double = 5
    @Published var gender: Gender = .female
    
    func determineZone() {
        let hot = Int(hotness)
        let crazy = Int(craziness)
        
        switch gender {
        case .female:
            switch (hot, crazy) {
            case (let h, let c) where h < 5 && c > 7:
                zone = Zone(imageName: "no_go_zone", description: "No-Go Zone")
            case (let h, let c) where h >= 5 && h < 8 && c > 5 && c <= 7:
                zone = Zone(imageName: "fun_zone", description: "Fun Zone")
            case (let h, let c) where h >= 8 && c > 7:
                zone = Zone(imageName: "danger_zone", description: "Danger Zone")
            case (let h, let c) where h >= 6 && h < 8 && c <= 5:
                zone = Zone(imageName: "date_zone", description: "Date Zone")
            case (let h, let c) where h >= 8 && c <= 5:
                zone = Zone(imageName: "Marry_zone", description: "Marry Zone")
            default:
                zone = Zone(imageName: "undefined_zone", description: "Undefined Zone")
            }
        case .male:
            // Different logic for males (this is just an example)
            switch (hot, crazy) {
            case (let h, let c) where h < 4 && c > 6:
                zone = Zone(imageName: "no_go_zone", description: "No-Go Zone")
            case (let h, let c) where h >= 4 && h < 7 && c > 4 && c <= 6:
                zone = Zone(imageName: "fun_zone", description: "Fun Zone")
            case (let h, let c) where h >= 7 && c > 6:
                zone = Zone(imageName: "danger_zone", description: "Danger Zone")
            case (let h, let c) where h >= 5 && h < 7 && c <= 4:
                zone = Zone(imageName: "date_zone", description: "Date Zone")
            case (let h, let c) where h >= 7 && c <= 4:
                zone = Zone(imageName: "Marry_zone", description: "Marry Zone")
            default:
                zone = Zone(imageName: "undefined_zone", description: "Undefined Zone")
            }
        }
    }
}
