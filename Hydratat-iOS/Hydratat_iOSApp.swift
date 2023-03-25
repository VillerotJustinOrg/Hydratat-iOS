//
//  Hydratat_iOSApp.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/13/23.
//

import SwiftUI

@main
struct Hydratat_iOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AppViewModel())
        }
    }
}
