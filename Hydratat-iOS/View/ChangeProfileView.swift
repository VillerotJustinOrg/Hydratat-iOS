//
//  ChangeProfileView.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/20/23.
//

import SwiftUI

struct ChangeProfileView: View {
    @State var user: User = User.allCases[0]
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                AvatarView(width: 50, height: 75/*, currentUser: user*/)
            }
            
            HStack {
                TextField("Name", text: $user.name)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
                
                TextField("Age", text: $user.name)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
            }
            
            HStack {
                TextField("Height", text: $user.name)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
                
                TextField("Weight", text: $user.name)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
            }
            
            Button {
            } label: {
                Text("Update profile")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)

            }
        }
        .navigationTitle("Update profile")
    }
}

struct ChangeProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeProfileView()
    }
}
