//
//  Accomplishment.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/6/23.
//

import Foundation

struct Accomplishment {
    var id_accomp = UUID()
    var name_accomp: String
    var description: String
    var is_accomplished: Bool = false
    
    mutating func setAccomplished() {
        self.is_accomplished = true
    }
    
    static func getNbAccomplished() -> Int {
        var nb = 0
        for acc in Accomplishment.allCases {
            if acc.is_accomplished {
                nb += 1
            }
        }
        return nb
    }
    
    static var allCases = [
        Accomplishment(name_accomp: "1st", description: "Drink for the first time"),
        Accomplishment(name_accomp: "x10", description: "Drink ten liters of drinking since the beginning"),
        Accomplishment(name_accomp: "10 days", description: "Ten daily goals achieved")
    ]
}

enum Accomplishments : String, CaseIterable {
    case yjfe
    case kfedh
}
