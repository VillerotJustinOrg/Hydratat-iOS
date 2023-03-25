//
//  ProfileView.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/6/23.
//

import SwiftUI

struct ProfileView: View {
    @State var user: User
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                VStack(spacing: 10) {
                    Button {
                    } label: {
                        NavigationLink(destination: ChangeAvatarView(user: user)) {
                            AvatarView(size: 50, user: user)
                        }
                    }
                    Text("\(user.name), \(user.age) years old")
                        .font(.title)
                    Text("\(user.height) cm, \(user.weight) kg")
                        .font(.title2)
                    Text("Drinking objective : \(user.drinking_objectif) mL")
                        .foregroundColor(.white)
                        .background(.blue)
                }
                                
                Button {
                } label: {
                    NavigationLink(destination: ChangeProfileView(user: user)) {
                        Text("Change profile")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Change", destination: ChangeUserView())
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.allCases[0])
    }
}
