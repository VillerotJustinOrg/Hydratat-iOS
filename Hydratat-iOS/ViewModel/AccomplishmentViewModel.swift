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
    
    func addUser(name: String, age: Int, height: Double, weight: Int, color1: String, color2: String) {
        User.allCases.append(User(avatar: Avatar(color1: color1, color2: color2), name: name, age: age, height: height, weight: weight))
    }
}
