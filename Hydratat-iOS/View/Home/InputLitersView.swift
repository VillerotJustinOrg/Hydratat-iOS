//
//  InputLitersView.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/22/23.
//

import SwiftUI

struct InputLitersView: View {
    @EnvironmentObject var data: AppViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var content: Int = 0
    @State var type: TypeQuantity = .Verre
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Type quantity : ")
                Picker("Type quantity", selection: $type) {
                    ForEach(TypeQuantity.allCases, id: \.self) { t in
                        Text(t.rawValue)
                    }
                }.pickerStyle(.menu)
            }
            
            Picker("Type quantity", selection: $content) {
                ForEach(type.contentML, id: \.self) { cont in
                    Text(cont >= 1000 ? "\(String(format: "%.1f", Double(cont)/1000.0))L" : "\(cont)mL")
                }
            }.pickerStyle(.segmented)
            
            Button {
                saveButtonPressed()
            } label : {
                Text("Save")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }
        }
        .navigationTitle("Add quantity")
        .alert(isPresented: $showAlert) {
            Alert(title: Text("The content value is incorrect"))
        }
        .padding()
    }
    
    func saveButtonPressed() {
        if(content == 0) {
            showAlert.toggle()
        } else {
            data.currentUser.addQuantity(quantity: Quantity(type_quantity: type, content: content, day: Date.now.formatted(date: .numeric, time: .omitted)))
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct InputLitersView_Previews: PreviewProvider {
    static var previews: some View {
        InputLitersView().environmentObject(AppViewModel())
    }
}
