//
//  Quantity.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/25/23.
//

import Foundation

enum TypeQuantity: String, CaseIterable {
    case Glass
    case Can
    case Bottle
    
    var contentML: [Int] {
        switch self {
            case .Glass: return [150, 250]
            case .Can: return [250, 330, 500]
            case .Bottle: return [250, 330, 500, 1000, 1500, 2000]
        }
    }
}

struct Quantity {
    var id_quantity: UUID
    var type_quantity: TypeQuantity
    var content: Int
    var day: String
    
    init(type_quantity: TypeQuantity, content: Int, date: Date) {
        self.id_quantity = UUID()
        self.type_quantity = type_quantity
        self.content = content
        self.day = date.formatted(date: .numeric, time: .omitted)
    }
}
