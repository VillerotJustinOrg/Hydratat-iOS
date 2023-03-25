//
//  ContentView.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/13/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            VStack {
                HStack {
                    Text("Hydratat-iOS").font(Font.custom("waver", size: 28))
                }
                TabView {
                    HomeView(user: viewModel.getCurrentUser())
                        .tabItem {
                            Image(systemName: "homekit")
                            Text("Home")
                        }
                    
                    StatsView()
                        .tabItem {
                            Image(systemName: "chart.bar")
                            Text("Stats")
                        }
                    
                    ProfileView(user: viewModel.getCurrentUser())
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
        ContentView().environmentObject(AppViewModel())
    }
}
