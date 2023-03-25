//
//  StatsView.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/6/23.
//

import SwiftUI

struct StatsView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @State private var progress = 0.5

    var body: some View {
        ScrollView {
            Spacer()
            VStack(spacing: 20) {
                Text("Accomplishments : \(viewModel.getNbAccomplished())/\(viewModel.accomplishments.count)")
                VStack(alignment: .leading) {
                    ForEach(viewModel.accomplishments, id: \.self.id_accomp) { acc in
                        AccomplishmentView(accomplishment: acc).environmentObject(AppViewModel())
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
