//
//  JurisdictionListView.swift
//  FOIAPhone
//
//  Created by me on 10/24/25.
//

import SwiftData
import SwiftUI

struct JurisdictionListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var jurisdictions: [Jurisdiction]
    @State private var viewModel: JurisdictionListViewModel = JurisdictionListViewModel()

    var body: some View {
        Form {
            List(viewModel.jurisidictions) {
                jurisdiction in
               
                VStack(alignment: .leading) {
                    Text(jurisdiction.name)
                        .font(.title2)
                    Text("Statute: \(jurisdiction.law)")
                    Text("Agencies: \(jurisdiction.agencies.count)")


                }

            }
        }
        .navigationTitle("Jurisdictions")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.jurisidictions = self.jurisdictions
            viewModel.modelContext = self.modelContext

        }

    }

}

#Preview {
    let testData = TestData.shared
    NavigationView {
        JurisdictionListView()
            .modelContext(testData.container.mainContext)

    }

}
