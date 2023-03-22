//
//  ChangeAvatarView.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/22/23.
//

import SwiftUI

struct ChangeAvatarView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var user: User
    
    var body: some View {
        VStack {
            Text("\(user.name)'s avatar")
                .font(.title)
            Spacer()
            AvatarView(width: 100, height: 150)
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
                    TextField("Name", text: $user.avatar.color1)
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
        self.presentationMode.wrappedValue.dismiss()    //Retourne à la page précédente après le click sur Save
    }
}

struct ChangeAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeAvatarView(user: User.allCases[0])
    }
}
