//
//  ProfileView.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/6/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                VStack(spacing: 10) {
                    AvatarView(width: 50, height: 75/*, currentUser: user*/)
                    Text("Username, Age")//user.name, user.age
                        .font(.title)
                    Text("Height, weight")//user.height, user.weight
                        .font(.title2)
                }
                                
                Button {
                } label: {
                    NavigationLink(destination: ChangeProfileView()) {
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
        ProfileView()
    }
}
