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
                .foregroundColor(getColorFromStr(string: user.avatar.color1))
                .frame(height: height * 1.1)
            
            Image("Drop")
                .resizable()
                .renderingMode(.template)
                .frame(width: size, height: height)
                .foregroundColor(getColorFromStr(string: user.avatar.color2))
        }
    }
    
    func getColorFromStr(string: String) -> Color {
        let colors: [Color] = [.black, .white, .gray, .red, .green, .blue, .orange, .yellow, .pink, .purple, .accentColor, .primary, .secondary]
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
        VStack(spacing: 20) {
            let colors: [Color] = [.black, .white, .gray, .red, .green, .blue, .orange, .yellow, .pink, .purple, .accentColor, .primary, .secondary]
            HStack {
                ForEach(User.allCases, id: \.self.id_user) { user in
                    Button {
                    } label: {
                        AvatarView(size: 70, user: user)
                    }
                }
            }
            ScrollView(.horizontal) {
                ZStack {
                    Color.gray.ignoresSafeArea().frame(height: 50)
                    HStack {
                        ForEach(colors, id: \.self) { index in
                            Rectangle()
                                .cornerRadius(10)
                                .foregroundColor(index)
                                .frame(width: 40, height: 40)
                        }
                    }
                }
            }.padding()

        }
    }
}
