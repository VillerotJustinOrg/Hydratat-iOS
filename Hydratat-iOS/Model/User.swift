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
    
    static var allCases: [User] = [
        User(avatar: Avatar(color1: "red", color2: "purple"), name: "egyfj", age: 28, height: 1.75, weight: 68)
    ]
    
    mutating func modify(name: String, age: Int, height: Double, weight: Int, color1: String, color2: String) {
        self.name = name
        self.age = age
        self.height = height
        self.weight = weight
        self.avatar = Avatar(color1: color1, color2: color2)
    }
}
