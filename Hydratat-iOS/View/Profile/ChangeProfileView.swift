//
//  ChangeProfileView.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/20/23.
//

import SwiftUI

struct ChangeProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AppViewModel
    @State var user: User
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack {
            AvatarView(size: 50, user: user)
            
            HStack {
                Text("Username : ")
                TextField("Name", text: $user.name)
                    .padding(.horizontal)
                    .frame(width: 200, height: 55)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
            }
            
            HStack {
                Text("Age : ")
                TextField("Age", value: $user.age, formatter: NumberFormatter())
                    .padding(.horizontal)
                    .frame(width: 200, height: 55)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
            }
            
            HStack {
                Text("Email : ")
                TextField("Email", text: $user.email)
                    .padding(.horizontal)
                    .frame(width: 200, height: 55)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
            }
            
            HStack {
                Text("Height : ")
                TextField("Height", value: $user.height, formatter: NumberFormatter())
                    .padding(.horizontal)
                    .frame(width: 200, height: 55)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
                Text("cm")
            }
            HStack {
                Text("Weight : ")
                TextField("Weight", value: $user.weight, formatter: NumberFormatter())
                    .padding(.horizontal)
                    .frame(width: 200, height: 55)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
                Text("kg")
            }
            
            HStack {
                Text("Drinking\nobjective : ")
                TextField("Drinking objective", value: $user.drinking_objectif, formatter: NumberFormatter())
                    .padding(.horizontal)
                    .frame(width: 200, height: 55)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
                Text("mL")
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
                
            }.padding()
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
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func getResp() -> [String] {
        return [user.name, String(user.age), String(user.height), String(user.weight), String(user.drinking_objectif)]
    }
}

struct ChangeProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeProfileView(user: User.allCases[0]).environmentObject(AppViewModel())
    }
}
