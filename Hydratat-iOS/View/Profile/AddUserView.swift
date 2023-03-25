//
//  AddUserView.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/25/23.
//

import SwiftUI

struct AddUserView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AppViewModel
    @State private var showAlert = false
    @State var values = ["","","","","",""]
    @State private var alertContent = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Username : ")
                TextField("Name", text: $values[0])
                    .padding(.horizontal)
                    .frame(width: 200, height: 55)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
            }
            
            HStack {
                Text("Age : ")
                TextField("Age", value: $values[1], formatter: NumberFormatter())
                    .padding(.horizontal)
                    .frame(width: 200, height: 55)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
            }
            
            HStack {
                Text("Email : ")
                TextField("Email", text: $values[2])
                    .padding(.horizontal)
                    .frame(width: 200, height: 55)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
            }
            
            HStack {
                Text("Height : ")
                TextField("Height", value: $values[3], formatter: NumberFormatter())
                    .padding(.horizontal)
                    .frame(width: 200, height: 55)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
                Text("cm")
            }
            HStack {
                Text("Weight : ")
                TextField("Weight", value: $values[4], formatter: NumberFormatter())
                    .padding(.horizontal)
                    .frame(width: 200, height: 55)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
                Text("kg")
            }
            
            HStack {
                Text("Drinking\nobjective : ")
                TextField("Drinking objective", value: $values[5], formatter: NumberFormatter())
                    .padding(.horizontal)
                    .frame(width: 200, height: 55)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
                Text("mL")
            }
            
            Button {
                saveButtonPressed()
            } label: {
                Text("Add user")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                
            }.padding()
        }
        .navigationTitle("Add user")
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertContent))
        }
    }
    
    func saveButtonPressed() {
        if(values[0].count < 3) {
            alertContent = "Your item must be at least 3 characters long"
            showAlert.toggle()
        } else if(!values[2].contains("@")) {
            alertContent = "Your item must be at least 3 characters long"
            showAlert.toggle()
        } else {
            viewModel.addUser(name: values[0], age: Int(values[1])!, email: values[2], height: Int(values[3])!, weight: Int(values[4])!, drinking_objectif: Int(values[5])!, avatar: Avatar(color1: "red", color2: "yellow"))
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct AddUserView_Previews: PreviewProvider {
    static var previews: some View {
        AddUserView()
    }
}
