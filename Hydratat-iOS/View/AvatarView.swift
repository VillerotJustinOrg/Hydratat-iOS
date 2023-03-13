//
//  AvatarView.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/6/23.
//

import SwiftUI

struct AvatarView: View {
    //@State var currentUser: User
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.blue)
                .frame(width: 25)
            
            Image("Drop")
                .renderingMode(.template)
                .foregroundColor(.orange)
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
