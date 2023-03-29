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
    var email: String
    var height: Int //en cm
    var weight: Int
    var drinking_objectif: Int //en mL
    var quantites: [Quantity]
    
    static var allCases: [User] = [
        User(avatar: Avatar(color1: "orange", color2: "purple"), name: "Flo", age: 28, email: "flo@gmail.com", height: 179, weight: 71, drinking_objectif: 1500,
             quantites: [Quantity(type_quantity: .Bouteille, content: 2000, date: .init(timeInterval: -86400, since: .now)) ]),
        User(avatar: Avatar(color1: "blue", color2: "green"), name: "Justin", age: 28, email: "justin@gmail.com", height: 175, weight: 65, drinking_objectif: 1000,
             quantites: [Quantity(type_quantity: .Bouteille, content: 500, date: .init(timeInterval: -86400, since: .now)),
                         Quantity(type_quantity: .Canette, content: 500, date: .init(timeInterval: -86400, since: .now))]),
        User(avatar: Avatar(color1: "red", color2: "orange"), name: "David", age: 28, email: "david@gmail.com", height: 178, weight: 68, drinking_objectif: 1000,
             quantites: [Quantity(type_quantity: .Verre, content: 150, date: .init(timeInterval: -86400, since: .now)),
                         Quantity(type_quantity: .Bouteille, content: 1000, date: .init(timeInterval: -86400, since: .now))])
    ]
    
    mutating func modifyAvatar(color1: String, color2: String) {
        self.avatar = Avatar(color1: color1, color2: color2)
    }
    
    mutating func addQuantity(quantity: Quantity) {
        self.quantites.append(quantity)
    }
    
    func getAllDatesFromQuantities() -> [String] {
        var dates: [String] = []
        var previousDay = ""
        for qu in self.quantites {
            if qu.day != previousDay {
                dates.append(qu.day)
                previousDay = qu.day
            }
        }
        return dates
    }
            
    func getQuantities() -> [Quantity] {
        return self.quantites
    }
    
    mutating func getSumQuantityDay(day: String) -> Int {
        var sum = 0
        for qu in quantites {
            if(qu.day == day) {
                sum += qu.content
            }
        }
        return sum
    }
    
    mutating func getQuantityDay(day: String) -> [Quantity] {
        var tab: [Quantity] = []
        for qu in quantites {
            if(qu.day == day) {
                tab.append(qu)
            }
        }
        return tab
    }
    
    mutating func modifyProfile(name: String, age: Int, email: String, height: Int, weight: Int, drinking: Int) {
        self.name = name
        self.age = age
        self.email = email
        self.height = height
        self.weight = weight
        self.drinking_objectif = drinking
    }
    
    mutating func equalsTo(user: User) -> Bool {
        return self.id_user == user.id_user && self.avatar.equalsTo(avatar: user.avatar) && self.name == user.name && self.age == user.age &&
                self.email == user.email && self.height == user.height && self.weight == user.weight && self.drinking_objectif == user.drinking_objectif
    }
}
