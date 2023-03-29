//
//  AccomplishmentView.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/8/23.
//

import SwiftUI

struct AccomplishmentView: View {
    @State var showDetails = false
    @State var user: User
    @State var date: String
    
    var body: some View {
        var quantities = user.getQuantityDay(day: date)
        VStack {
            let value = Double(user.getSumQuantityDay(day: date))/Double(user.drinking_objectif)
            let color: Color = value >= 1.0 ? .blue : .red
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.gray.opacity(0.5))
                    .frame(height: 100)

                Button {
                    showDetails.toggle()
                    quantities = user.getQuantityDay(day: date)
                } label: {
                    HStack(spacing: 15) {
                        Image("Drop_mini")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 60, height: 60)
                        
                        Text("\(date)")
                            .font(.title).bold()
                    }
                    .foregroundColor(color)
                }
                .padding()
            }
            
            if showDetails && quantities.count != 0 {
                ForEach(quantities, id: \.self.id_quantity) { qu in
                    Text("\(qu.type_quantity.rawValue) - \(qu.content) mL").multilineTextAlignment(.leading)
                }
            }
        }
    }
}

struct AccomplishmentView_Previews: PreviewProvider {
    static var previews: some View {
        AccomplishmentView(user: User.allCases[1], date: Date.init(timeInterval: -86400, since: .now).formatted(date: .numeric, time: .omitted))
    }
}
