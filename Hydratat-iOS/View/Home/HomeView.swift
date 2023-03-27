//
//  HomeView.swift
//  Expocar_iOS
//
//  Created by user234243 on 3/1/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            var user = viewModel.currentUser
            let value = Double(user.getSumQuantityDay(day: Date.now))/Double(user.drinking_objectif)
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
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(AppViewModel())
    }
}
