//
//  HomeView.swift
//  Expocar_iOS
//
//  Created by user234243 on 3/1/23.
//

import SwiftUI

struct HomeView: View {
    @State private var value: Double = 0.5
    
    var body: some View {
        HStack(spacing: 15) {
            Image("Bottle5")
                .resizable()
                .frame(width: 175, height: 643)
            
            VStack {
                Text("Objectif  de la journée")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                
                Gauge(value: value, in: 0...1) {
                    Text("\(Int(value * 100))%")
                }
                .gaugeStyle(.accessoryCircularCapacity)
                .foregroundColor(.orange)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
