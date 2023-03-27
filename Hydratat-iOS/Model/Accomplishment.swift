//
//  Accomplishment.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/6/23.
//

import Foundation

struct Accomplishment {
    var id_accomp : UUID
    var name_accomp: String
    var description: String
    var progression: Double
    var is_accomplished: Bool
    
    init(name_accomp: String, description: String, progression: Double) {
        self.id_accomp = UUID()
        self.name_accomp = name_accomp
        self.description = description
        self.progression = progression
        self.is_accomplished = progression >= 1.0
    }
    
    mutating func increaseProgession(prog: Double) {
        self.progression += prog
        self.is_accomplished = progression >= 1.0
    }
    
    static var allCases = [
        Accomplishment(name_accomp: "1st", description: "Drink for the first time", progression: 0.0),
        Accomplishment(name_accomp: "x10", description: "Drink ten liters of drinking since the beginning", progression: 0.0),
        Accomplishment(name_accomp: "5 days", description: "Five daily goals achieved", progression: 0.0)
    ]
}
