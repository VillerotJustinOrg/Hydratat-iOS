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
                    /*NavigationLink(destination: ProfileView()) {
                        Button {
                            
                        } label: {
                            AvatarView()
                        }
                    }*/
                }
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "homekit")
                            Text("Home")
                        }
                    
                    StatsView()
                        .tabItem {
                            Image(systemName: "map")
                            Text("Stats")
                        }
                    
                    ProfileView()
                        .tabItem {
                            AvatarView()
                            Text("Your profile")
                        }
                }
            }
            /*.listStyle(PlainListStyle())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ProfileView()) {
                        Button {
                            
                        } label: {
                            AvatarView()
                        }
                    }
                }
            }*/
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
