//
//  AccomplishmentView.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/8/23.
//

import SwiftUI

struct AccomplishmentView: View {
    @State var accomplishment: Accomplishment
    @State private var value: Double = 0.5
    
    var body: some View {
        let color: Color = accomplishment.is_accomplished ? .green : .red
        HStack(spacing: 15) {
            if(accomplishment.is_accomplished) {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
            } else {
                Gauge(value: value, in: 0...1) {
                    Text("\(Int(value * 100))%")
                }
                .frame(width: 60, height: 60)
                .gaugeStyle(.accessoryCircularCapacity)
                .foregroundColor(color)
            }

            VStack(spacing: 5) {
                Text("\(accomplishment.name_accomp)")
                    .font(.title).bold()
                    
                Text("\(accomplishment.description)")
            }
        }
        .padding()
        .foregroundColor(color)
        .background(.gray.opacity(0.5))
        .frame(height: 100)
    }
}

struct AccomplishmentView_Previews: PreviewProvider {
    static var previews: some View {
        AccomplishmentView(accomplishment: Accomplishment.allCases[1])
    }
}
