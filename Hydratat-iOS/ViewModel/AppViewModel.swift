//
//  AccomplishmentViewModel.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/6/23.
//

import Foundation

class AppViewModel: ObservableObject {
    private var currentUser: User = User.allCases[1]
    @Published var accomplishments : [Accomplishment] = []
    @Published var users: [User] = []
    
    init() {
        setAccomplishments()
        setUsers()
    }
    
    private func setAccomplishments() {
        accomplishments.append(contentsOf: Accomplishment.allCases)
    }
    
    private func setUsers() {
        users.append(contentsOf: User.allCases)
    }
    
    func getCurrentUser() -> User {
        return self.currentUser
    }
    
    func changeUser(user: User) {
        self.currentUser = user
    }
    
    func compareUsers(user: User) -> Bool {
        return currentUser.equalsTo(user: user)
    }
    
    func addUser(name: String, age: Int, email: String, height: Int, weight: Int, drinking_objectif: Int, avatar: Avatar) {
        users.append(User(avatar: avatar, name: name, age: age, email: email, height: height, weight: weight, drinking_objectif: drinking_objectif))
    }
    
    func getNbAccomplished() -> Int {
        var nb = 0
        for acc in accomplishments {
            if acc.is_accomplished {
                nb += 1
            }
        }
        return nb
    }
}
