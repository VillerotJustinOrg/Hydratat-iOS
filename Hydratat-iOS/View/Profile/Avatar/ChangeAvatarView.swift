//
//  ChangeAvatarView.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/22/23.
//

import SwiftUI

struct ChangeAvatarView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AppViewModel
    @State var user: User
    
    var body: some View {
        VStack {
            Spacer()
            AvatarView(size: 100, user: user)
            VStack {
                HStack {
                    Text("Color 1 : ")
                    TextField("Name", text: $user.avatar.color1)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray4))
                        .cornerRadius(10)
                }
                HStack {
                    Text("Color 2 : ")
                    TextField("Name", text: $user.avatar.color2)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray4))
                        .cornerRadius(10)
                }
            }.padding()
            
            Button {
                saveButtonPressed()
            } label: {
                Text("Update avatar")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                
            }.padding()
            Spacer()
        }
    }
    
    func saveButtonPressed() {
        user.modifyAvatar(color1: user.avatar.color1, color2: user.avatar.color2)
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct ChangeAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeAvatarView(user: User.allCases[0]).environmentObject(AppViewModel())
    }
}
