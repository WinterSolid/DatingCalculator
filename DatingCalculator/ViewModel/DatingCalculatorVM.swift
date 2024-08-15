//
//  DatingCalculatorVM.swift
//  DatingCalculator
//
//  Created by ZakTank on 8/14/24.
//
import Combine
import UIKit

class DatingCalculatorVM: ObservableObject {
    @Published var zone: Zone?
    @Published var hotness: Double = 5
    @Published var craziness: Double = 5
    
    func determineZone() {
        let hot = Int(hotness)
        let crazy = Int(craziness)
        
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
            zone = Zone(imageName: "wife_zone", description: "Wife Zone")
        default:
            zone = Zone(imageName: "undefined_zone", description: "Undefined Zone")
        }
    }
}
