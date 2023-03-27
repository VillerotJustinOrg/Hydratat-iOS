//
//  ProfileView.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/6/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                let user = viewModel.currentUser
                HStack(spacing: 30) {
                    AvatarView(size: 75, user: user)
                    VStack(spacing: 10) {
                        Text("\(user.name)")
                            .font(.system(size: 36))
                            .bold()
                        Text("\(user.age) years old")
                            .font(.system(size: 24))
                        Text("\(user.height) cm, \(user.weight) kg")
                            .font(.title2)
                    }
                }
                
                Text("Drinking objective : \(user.drinking_objectif) mL")
                    .padding()
                    .bold().italic()
                    .font(.system(size: 24))
                    .foregroundColor(.blue)
                                
                Button {
                } label: {
                    NavigationLink(destination: ChangeProfileView(user: user)) {
                        Text("Change profile")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    }
                }
                
                Spacer()
            }
            .padding()
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
        ProfileView().environmentObject(AppViewModel())
    }
}
