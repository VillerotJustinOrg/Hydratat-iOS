//
//  StatsView.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/6/23.
//

import SwiftUI

struct StatsView: View {
    @State private var progress = 0.5

    var body: some View {
        VStack(spacing: 20) {
            Text("Accomplishments : \(Accomplishment.getNbAccomplished())/\(Accomplishment.allCases.count)")
            VStack(alignment: .leading) {
                ForEach(Accomplishment.allCases, id: \.self.id_accomp) { acc in
                    AccomplishmentView(accomplishment: acc)
                }
            }
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
