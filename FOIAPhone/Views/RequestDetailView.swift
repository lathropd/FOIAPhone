//
//  RequestDetailView.swift
//  FOIAPhone
//
//  Created by me on 10/24/25.
//

import SwiftUI
import SwiftData


struct RequestDetailView: View {
    @Environment(\.modelContext) private var modelContext
    var actor: RequestActor?
    
    var body: some View {
        Form{
            Text("Request Details")
                
        }.navigationTitle("Request")
        .navigationBarTitleDisplayMode(.large)

    }
}

#Preview {
    let testData = TestData.shared


    RequestDetailView()
        .modelContext(testData.container.mainContext)

}
