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
            let user = viewModel.currentUser
            Spacer()
            VStack(spacing: 20) {
                Text("\(user.name)'s statistics")
                    .font(.title2)
                VStack(alignment: .leading) {
                    ForEach(user.getAllDatesFromQuantities(), id: \.self) { date in
                        AccomplishmentView(user: user, date: date)
                    }
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
