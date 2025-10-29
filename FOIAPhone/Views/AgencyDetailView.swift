//  AgencyDetailView.swift
//  FOIAPhone
//
//  Created by me on 10/28/25.
//

import SwiftUI
import SwiftData

struct AgencyDetailView: View {
    @Environment(\.modelContext) private var modelContext
    var data: Agency
    var actor: AgencyActor?
    
    var body: some View {
        Form{
            Text("Agency Details")
        }
            .navigationTitle("Agency")
            .navigationBarTitleDisplayMode(.large)

    }
}

#Preview {
    
    
    let testData = TestData.shared
    let data = TestRecords.shared.agencies[0]

    AgencyDetailView(data: data)
        .modelContext(testData.container.mainContext)
}

