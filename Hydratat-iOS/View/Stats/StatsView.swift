//
//  StatsView.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/6/23.
//

import SwiftUI

struct StatsView: View {
    @EnvironmentObject var viewModel: AppViewModel

    var body: some View {
        ScrollView {
            var user = viewModel.currentUser
            Spacer()
            VStack(spacing: 20) {
                Text("\(user.name)'s accomplishments : \(user.getNbAccomplished())/\(user.accomplishments.count)")
                VStack(alignment: .leading) {
                    ForEach(user.accomplishments, id: \.self.id_accomp) { acc in
                        AccomplishmentView(accomplishment: acc).environmentObject(AppViewModel())
                    }
                }
            }
            VStack {
                ForEach(user.quantites, id: \.self.id_quantity) { qu in
                    Text("\(qu.type_quantity.rawValue) - \(qu.content)mL")
                }
            }
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView().environmentObject(AppViewModel())
    }
}
