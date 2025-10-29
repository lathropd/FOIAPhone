//  AgencyDetailView.swift
//  FOIAPhone
//
//  Created by me on 10/28/25.
//

import SwiftUI
import SwiftData

struct AgencyDetailView: View {
    @Environment(\.modelContext) private var modelContext
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
    let context = testData.container.mainContext

    AgencyDetailView()
        .modelContext(context)
}

