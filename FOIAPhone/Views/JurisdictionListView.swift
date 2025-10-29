//
//  JurisdictionListView.swift
//  FOIAPhone
//
//  Created by me on 10/28/25.
//

import SwiftUI
import SwiftData


struct JurisdictionListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var data: [Jurisdiction]
    var actor: JursidictionActor?


    
    var body: some View {
        Form{
            Text("Jurisdction List")
        }
            .navigationTitle("Jurisdictions")
            .navigationBarTitleDisplayMode(.large)

    }
}

#Preview {
    let testData = TestData.shared



    JurisdictionListView()
        .modelContext(testData.container.mainContext)

}
