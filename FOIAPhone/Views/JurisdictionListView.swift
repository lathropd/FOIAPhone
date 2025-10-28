//
//  JurisdictionListView.swift
//  FOIAPhone
//
//  Created by me on 10/28/25.
//

import SwiftUI

struct JurisdictionListView: View {
    @Binding var data: [Jurisdiction]
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
    @Previewable @State var jurisdictions = TestData.shared.jurisdictions

    JurisdictionListView(data: $jurisdictions)
}
