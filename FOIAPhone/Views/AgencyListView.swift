//  AgencyListView.swift
//  FOIAPhone
//
//  Created by me on 10/28/25.
//

import SwiftUI

struct AgencyListView: View {
    @Environment(\.modelContext) private var modelContext
    var actor: AgencyActor?
    
    var body: some View {
        Form{
            Text("Agency List")
        }
            .navigationTitle("Agencies")
            .navigationBarTitleDisplayMode(.large) 

    }
}

#Preview {
    @Previewable @State var agencies = TestData.shared.agencies
    
    AgencyListView(data: $agencies)
}
