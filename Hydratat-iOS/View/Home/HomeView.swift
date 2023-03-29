//
//  HomeView.swift
//  Expocar_iOS
//
//  Created by user234243 on 3/1/23.
//

import SwiftUI
import Combine

struct HomeView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @State private var showAlert = false
    @State private var changeAlert = false
    @State private var modifycontent = ""
    
    var body: some View {
        NavigationView {
            var user = viewModel.currentUser
            let value = Double(user.getSumQuantityDay(day: Date.now.formatted(date: .numeric, time: .omitted)))/Double(user.drinking_objectif)
            HStack(spacing: 15) {
                Image(value > 1 ? "Bottle9" : "Bottle\(Int(value*8) + 1)")
                    .resizable()
                    .frame(width: 175, height: 643)
                
                VStack(spacing: 30) {
                    Text("Objectif  de la journée : \(user.drinking_objectif)mL")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                    
                    if value >= 1 {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                            
                            Text("Atteint pour aujourd'hui").bold()
                        }
                        .onReceive(Just(value)) { newValue in
                            if newValue > 1.0 {
                                showAlert = true
                            }
                        }
                        .foregroundColor(.green)
                    } else {
                        Gauge(value: value, in: 0...1) {
                            Text("\(Int(value * 100))%")
                        }
                        .gaugeStyle(.accessoryCircularCapacity)
                        .foregroundColor(value >= 0.5 ? .orange : .red)
                    }
                    
                    Button {
                    } label: {
                        NavigationLink(destination: InputLitersView()) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .foregroundColor(.accentColor)
                                .frame(width: 50, height: 50)
                        }
                    }
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Voulez-vous augmenter votre objectif journalier ?"),
                    primaryButton: .default(Text("OUI")) {
                        changeAlert = true
                    },
                    secondaryButton: .cancel())
            }
            .alert("Nouvel objectif journalier", isPresented: $changeAlert, actions: {
                Button("OK", action: {
                    // Vérifie si modify content ne contient que des chiffres
                    let allNumb = modifycontent.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
                    
                    if modifycontent != "" && allNumb {
                        changeAlert = false
                        user.drinking_objectif = Int(modifycontent)!
                    }
                })
                TextField("TextField", text: $modifycontent)
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(AppViewModel())
    }
}
