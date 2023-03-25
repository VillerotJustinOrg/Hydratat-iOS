//
//  HomeView.swift
//  Expocar_iOS
//
//  Created by user234243 on 3/1/23.
//

import SwiftUI

struct HomeView: View {
    private var user: User
    private var value: Double
    
    init(user: User) {
        self.user = user
        self.value = Double(user.drinking_objectif)/2000.0
    }
    
    var body: some View {
        NavigationView {
            HStack(spacing: 15) {
                Image("Bottle\(Int(value*8) + 1)")
                    .resizable()
                    .frame(width: 175, height: 643)
                
                VStack(spacing: 30) {
                    Text("Objectif  de la journée")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                    
                    Gauge(value: value, in: 0...1) {
                        Text("\(Int(value * 100))%")
                    }
                    .gaugeStyle(.accessoryCircularCapacity)
                    .foregroundColor(.orange)
                    
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
        HomeView(user: User.allCases[0])
    }
}
