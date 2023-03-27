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
    var quantites: [Quantity] = []
    var accomplishments: [Accomplishment] = Accomplishment.allCases
    
    static var allCases: [User] = [
        User(avatar: Avatar(color1: "orange", color2: "purple"), name: "Flo", age: 28, email: "flo@gmail.com", height: 179, weight: 71, drinking_objectif: 1500),
        User(avatar: Avatar(color1: "blue", color2: "green"), name: "Justin", age: 28, email: "justin@gmail.com", height: 175, weight: 65, drinking_objectif: 1000),
        User(avatar: Avatar(color1: "red", color2: "orange"), name: "David", age: 28, email: "david@gmail.com", height: 178, weight: 68, drinking_objectif: 1000)
    ]
    
    mutating func modifyAvatar(color1: String, color2: String) {
        self.avatar = Avatar(color1: color1, color2: color2)
    }
    
    mutating func addQuantity(quantity: Quantity) {
        self.quantites.append(quantity)
    }
    
    mutating func getNbAccomplished() -> Int {
        var nb = 0
        for acc in self.accomplishments {
            if acc.is_accomplished {
                nb += 1
                print(nb)
            }
        }
        return nb
    }
            
    func getQuantities() -> [Quantity] {
        return self.quantites
    }
    
    mutating func getSumQuantityDay(day: Date) -> Int {
        var sum = 0
        let dateStr = day.formatted(date: .numeric, time: .omitted)
        for qu in quantites {
            if(qu.day == dateStr) {
                sum += qu.content
            }
        }
        print(sum)
        return sum
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
