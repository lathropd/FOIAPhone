//  AgencyDetailView.swift
//  FOIAPhone
//
//  Created by me on 10/28/25.
//

import SwiftUI

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
     
    @Previewable @State var agency = TestData.shared.agencies[0]

    
    AgencyDetailView(data: $agency)
}
