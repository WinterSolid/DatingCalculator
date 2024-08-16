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
                // No-Go Zone (Hot < 5, Crazy > 7)
            case (let h, let c) where h < 5 && c > 7:
                videoFileName = "no_go_zone"
                description =  "No Go"
                // Fun Zone (Hot 5-7, Crazy 5-7)
            case (let h, let c) where (5...7).contains(h) && (5...7).contains(c):
                videoFileName = "fun_zone"
                description =  "Fun Zone"
                //Danger Zone (Hot > 7, Crazy > 7)
            case (let h, let c) where h > 7 && c > 7:
                videoFileName = "danger_zone"
                description =  "Danger"
                // Date Zone (Hot 6-8, Crazy ≤ 5)
            case (let h, let c) where (6...8).contains(h) && c <= 5:
                videoFileName = "date_zone"
                description =  "Dateable"
                // Wife Zone (Hot > 8, Crazy ≤ 5)
            case (let h, let c) where h > 8 && c <= 5:
                videoFileName = "wife_zone"
                description =  "Marry"
                //Unicorn Zone (Hot > 8, Crazy < 4)
            case (let h, let c) where h > 8 && c < 4:
                videoFileName = "unicorn_F"
                description =  "Only in the Movies"
            default:
                videoFileName = "undefined_zone"
                description =  "undefined zone"
            }
        case .male:
            switch (hot, crazy) {
               // No-Go Zone (Hot < 5, Success < 5
            case (let h, let c) where h < 5 && c < 5:
                videoFileName = "no_go_zone"
                description =  "no go "
                // Fun Zone (Hot 5-7, Success 5-7)
            case (let h, let c) where (5...7).contains(h) && (5...7).contains(c):
                videoFileName = "fun_zone"
                description =  "Fun Zone"
                // Danger Zone (Hot > 7, Success < 5):
            case (let h, let c) where h > 7 && c < 5:
                videoFileName = "danger_zone"
                description =  "Danger"
                // Date Zone (Hot 6-8, Success 6-8)
            case (let h, let c) where (6...8).contains(h) && (6...8).contains(c):
                videoFileName = "date_zone"
                description =  "Dateable"
                // Marriage Zone (Hot > 8, Success > 8)
            case (let h, let c) where h > 8 && c < 5:
                videoFileName = "Marry Zone"
                description =  "Marry"
                //Unicorn Zone (Hot > 8, Crazy < 4)
            case (let h, let c) where h > 8 && c < 2:
                videoFileName = "unicorn_M"
                description =  "Only in the Movies"
            default:
                videoFileName = "undefined_zone"
                description =  "undefined_zone"
            }
        }
    }
}
