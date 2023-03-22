//
//  Person.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/6/23.
//

import Foundation

struct User {
    var id_user = UUID()
    var avatar: Avatar
    var name: String
    var age: Int
    var height: Double
    var weight: Int
    var drinking_objectif: Double //en mL
    
    static var allCases: [User] = [
        User(avatar: Avatar(color1: "orange", color2: "purple"), name: "Flo", age: 28, height: 1.75, weight: 68, drinking_objectif: 1000)
    ]
    
    mutating func modify(name: String, age: Int, height: Double, weight: Int, drinking: Double, color1: String, color2: String) {
        self.name = name
        self.age = age
        self.height = height
        self.weight = weight
        self.avatar = Avatar(color1: color1, color2: color2)
        self.drinking_objectif = drinking
    }
}
