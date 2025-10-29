//  AgencyListView.swift
//  FOIAPhone
//
//  Created by me on 10/28/25.
//

import SwiftUI
import SwiftData


struct AgencyListView: View {
    @Environment(\<#Root#>.modelContext) private var modelContext
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
    let testData = TestData.shared

    
    AgencyListView()
        .modelContext(testData.container.mainContext)

}
