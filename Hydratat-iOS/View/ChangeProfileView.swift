//
//  ChangeProfileView.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/20/23.
//

import SwiftUI

struct ChangeProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var user: User = User.allCases[0]
    @State var showAlert: Bool = false
    
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
                saveButtonPressed()
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
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Your item must be at least 3 characters long"))
        }
    }
    
    func saveButtonPressed() {
        if(user.name.count < 3) {
            showAlert.toggle()
        } else {
            self.presentationMode.wrappedValue.dismiss()    //Retourne à la page précédente après le click sur Save
        }
    }
}

struct ChangeProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeProfileView()
    }
}
