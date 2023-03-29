//
//  AccomplishmentViewModel.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/6/23.
//

import Foundation

class AppViewModel: ObservableObject {
    @Published var currentUser: User = User.allCases[1]
    @Published var users: [User] = []
    
    init() {
        setUsers()
    }
    
    private func setUsers() {
        users.append(contentsOf: User.allCases)
    }
    
    func changeUser(user: User) {
        self.currentUser = user
    }
    
    func compareUsers(user: User) -> Bool {
        return currentUser.equalsTo(user: user)
    }
    
    func addUser(name: String, age: Int, email: String, height: Int, weight: Int, drinking_objectif: Int, avatar: Avatar) {
        users.append(User(avatar: avatar, name: name, age: age, email: email, height: height, weight: weight, drinking_objectif: drinking_objectif, quantites: []))
    }
}
