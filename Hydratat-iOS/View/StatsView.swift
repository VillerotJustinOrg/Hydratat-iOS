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
        VStack {
            ProgressView(value: progress)
                .frame(width: 200.0)
                .progressViewStyle(.circular)
            
            Button("Augmenter la progression") {
                if progress < 1.0 {
                    progress += 0.1
                }
            }
            VStack {
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
