//
//  DatingCalculatorVM.swift
//  DatingCalculator
//
//  Created by ZakTank on 8/14/24.
//
import Combine
import AVKit

enum Gender {
    case male
    case female
}
class DatingCalculatorVM: ObservableObject {
    @Published var videoFileName: String?
    @Published var description: String?
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
                videoFileName = "no_go_zone"
                description =  "no_go_zone"
            case (let h, let c) where h >= 5 && h < 8 && c > 5 && c <= 7:
                videoFileName = "fun_zone"
                description =  "fun_zone"
            case (let h, let c) where h >= 8 && c > 7:
                videoFileName = "danger_zone"
                description =  "danger_zone"
            case (let h, let c) where h >= 6 && h < 8 && c <= 5:
                videoFileName = "date_zone"
                description =  "date_zone"
            case (let h, let c) where h >= 8 && c <= 5:
                videoFileName = "wife_zone"
                description =  "Wife Zone"
            default:
                videoFileName = "undefined_zone"
                description =  "undefined_zone"
            }
        case .male:
            // Different logic for males (this is just an example)
            switch (hot, crazy) {
            case (let h, let c) where h < 4 && c > 6:
                videoFileName = "no_go_zone"
            case (let h, let c) where h >= 4 && h < 7 && c > 4 && c <= 6:
                videoFileName = "fun_zone"
            case (let h, let c) where h >= 7 && c > 6:
                videoFileName = "danger_zone.mp4"
            case (let h, let c) where h >= 5 && h < 7 && c <= 4:
                videoFileName = "date_zone"
            case (let h, let c) where h >= 7 && c <= 4:
                videoFileName = "wife_zone"
            default:
                videoFileName = "undefined_zone"
            }
        }
    }
}
