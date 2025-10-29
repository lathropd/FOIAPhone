//
//  JurisdictionDetailView.swift
//  FOIAPhone
//
//  Created by me on 10/28/25.
//

import SwiftUI

struct JurisdictionDetailView: View {
    @Environment(\.modelContext) private var modelContext

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
    @Previewable @State var jurisdiction = TestData.shared.jurisdictions[0]

    
    JurisdictionDetailView(data: $jurisdiction)
}
