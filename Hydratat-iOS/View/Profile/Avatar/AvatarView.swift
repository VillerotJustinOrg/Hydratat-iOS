//
//  AvatarView.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/6/23.
//

import SwiftUI

struct AvatarView: View {
    @State var size: Double
    @State var user: User
    
    var body: some View {
        ZStack {
            let height = size * 1.5
            Circle()
                //.foregroundColor(.orange)
                .foregroundColor(getColorFromStr(string: user.avatar.color1))
                .frame(height: height * 1.1)
            
            Image("Drop")
                .resizable()
                .renderingMode(.template)
                //.foregroundColor(.purple)
                .frame(width: size, height: height)
                .foregroundColor(getColorFromStr(string: user.avatar.color2))
        }
    }
    
    func getColorFromStr(string: String) -> Color {
        let colors: [Color] = [.red, .yellow, .green, .blue, .orange, .purple]
        for color in colors {
            if color.description == string {
                return color
            }
        }
        return .accentColor
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(size: 50, user: User.allCases[0])
    }
}
