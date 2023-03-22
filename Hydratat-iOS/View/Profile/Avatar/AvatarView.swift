//
//  AvatarView.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/6/23.
//

import SwiftUI

struct AvatarView: View {
    @State var width: Double
    @State var height: Double
    //@State var avatar: Avatar
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.orange)
                //.foregroundColor(avatar.color1)
                .frame(height: height * 1.1)
            
            Image("Drop")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.purple)
                .frame(width: width, height: height)
                //.foregroundColor(avatar.color2)
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(width: 50, height: 75)
    }
}
