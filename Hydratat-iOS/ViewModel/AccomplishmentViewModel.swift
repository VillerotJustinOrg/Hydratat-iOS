//
//  AccomplishmentViewModel.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/6/23.
//

import Foundation

class AccomplishmentViewModel: ObservableObject {
    @Published var accomplishments : [Accomplishment] = []
    
    init() {
        setAccomplishments()
    }
    
    func setAccomplishments() {
        accomplishments.append(contentsOf: Accomplishment.allCases)
    }
}
