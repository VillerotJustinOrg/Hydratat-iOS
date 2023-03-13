//
//  AccomplishmentView.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/8/23.
//

import SwiftUI

struct AccomplishmentView: View {
    @State var accomplishment: Accomplishment
    
    var body: some View {
        let imageName = accomplishment.is_accomplished ? "checkmark.square.fill" : "square"
        let color: Color = accomplishment.is_accomplished ? .green : .red
        HStack {
            Button {
                accomplishment.is_accomplished.toggle()
            } label: {
                Image(systemName: imageName)
            }
            Text("\(accomplishment.name_accomp)")
        }.foregroundColor(color)
    }
}

struct AccomplishmentView_Previews: PreviewProvider {
    static var previews: some View {
        AccomplishmentView(accomplishment: Accomplishment.allCases[0])
    }
}
