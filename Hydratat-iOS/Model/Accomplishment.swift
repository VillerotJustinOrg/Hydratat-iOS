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
    
    static var allCases = [
        Accomplishment(name_accomp: "First time", description: "You drink for the first time"),
        Accomplishment(name_accomp: "Ten Liters", description: "You drunk ten liters of water since the beginning")
    ]
}

enum Accomplishments : String, CaseIterable {
    case yjfe
    case kfedh
}

/*enum Accomplishment: String, CaseIterable {
    case firstTime = "First time"
    case tenLiters = "Ten liters"
    
    var description: String {
        switch self {
            case .firstTime: return "Besoin journalier attient pour la 1ère fois"
        }
    }
}*/
