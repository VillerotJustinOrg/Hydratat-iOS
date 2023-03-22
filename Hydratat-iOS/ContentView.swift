//
//  ContentView.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/13/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            VStack {
                HStack {
                    Text("Hydratat-iOS").font(Font.custom("amazon_palafita", size: 24))
                }
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "homekit")
                            Text("Home")
                        }
                    
                    StatsView()
                        .tabItem {
                            Image(systemName: "chart.bar")
                            Text("Stats")
                        }
                    
                    ProfileView()
                        .tabItem {
                            Image("Drop_mini")
                                .renderingMode(.template)
                                .foregroundColor(.accentColor)
                            Text("Your profile")
                        }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
