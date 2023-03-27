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
    @State var values = ["","","@","","",""]
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
                TextField("Age", text: $values[1])
                    .padding(.horizontal)
                    .keyboardType(.numberPad)
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
                TextField("Height", text: $values[3])
                    .padding(.horizontal)
                    .keyboardType(.numberPad)
                    .frame(width: 200, height: 55)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
                Text("cm")
            }
            HStack {
                Text("Weight : ")
                TextField("Weight", text: $values[4])
                    .padding(.horizontal)
                    .keyboardType(.numberPad)
                    .frame(width: 200, height: 55)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
                Text("kg")
            }
            
            HStack {
                Text("Drinking\nobjective : ")
                TextField("Drinking objective", text: $values[5])
                    .padding(.horizontal)
                    .keyboardType(.numberPad)
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
            alertContent = "Email is not valid"
            showAlert.toggle()
        } else {
            let colors = generateTwoRandomColor()
            viewModel.addUser(name: values[0], age: Int(values[1])!, email: values[2], height: Int(values[3])!, weight: Int(values[4])!, drinking_objectif: Int(values[5])!, avatar: Avatar(color1: colors[0], color2: colors[1]))
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
    private func generateTwoRandomColor() -> [String] {
        let colors: [Color] = [.black, .white, .gray, .red, .green, .blue, .orange, .yellow, .pink, .purple, .accentColor, .primary, .secondary]
        var index1 = Int.random(in: 0...colors.count - 1)
        var index2 = Int.random(in: 0...colors.count - 1)
        
        while(index1 == index2) {
            index1 = Int.random(in: 0...colors.count - 1)
            index2 = Int.random(in: 0...colors.count - 1)
        }
        
        return [colors[index1].description, colors[index2].description]
    }
}

struct AddUserView_Previews: PreviewProvider {
    static var previews: some View {
        AddUserView().environmentObject(AppViewModel())
    }
}
