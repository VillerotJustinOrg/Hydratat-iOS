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
            case .Verre: return [250]
            case .Canette: return []
            case .Bouteille: return []
        }
    }
}
