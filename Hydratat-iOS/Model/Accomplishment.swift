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
    var is_accomplished: Bool
    
    mutating func setAccomplished() {
        self.is_accomplished = true
    }
    
    static var allCases = [
        Accomplishment(name_accomp: "1st", description: "Drink for the first time", is_accomplished: true),
        Accomplishment(name_accomp: "x10", description: "Drink ten liters of drinking since the beginning", is_accomplished: false),
        Accomplishment(name_accomp: "10 days", description: "Ten daily goals achieved", is_accomplished: false)
    ]
}

enum Accomplishments : String, CaseIterable {
    case yjfe
    case kfedh
}
