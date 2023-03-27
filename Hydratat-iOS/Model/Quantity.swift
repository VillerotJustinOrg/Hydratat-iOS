//
//  Quantity.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/25/23.
//

import Foundation

enum TypeQuantity: String, CaseIterable {
    case Verre
    case Canette
    case Bouteille
    
    var contentML: [Int] {
        switch self {
            case .Verre: return [150, 250]
            case .Canette: return [250, 330, 500]
            case .Bouteille: return [250, 330, 500, 1000, 1500, 2000]
        }
    }
}

struct Quantity {
    var id_quantity = UUID()
    var type_quantity: TypeQuantity
    var content: Int
    var day: String
}
