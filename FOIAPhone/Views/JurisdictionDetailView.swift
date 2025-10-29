//
//  JurisdictionDetailView.swift
//  FOIAPhone
//
//  Created by me on 10/28/25.
//

import SwiftUI
import SwiftData


struct JurisdictionDetailView: View {
    @Environment(\.modelContext) private var modelContext
    var data: Jurisdiction
    var actor: JursidictionActor?
    
    var body: some View {
        Form{
            Text("Jurisdction Details")
        }
            .navigationTitle("Jurisdiction")
            .navigationBarTitleDisplayMode(.large)

    }
}

#Preview {
    let testData = TestData.shared
    let data = TestRecords.shared.jurisdictions[0]


    
    JurisdictionDetailView(data: data)
        .modelContext(testData.container.mainContext)

}
