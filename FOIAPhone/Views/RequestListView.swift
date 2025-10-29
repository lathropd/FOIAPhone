//
//  RequestListView.swift
//  FOIAPhone
//
//  Created by me on 10/24/25.
//

import SwiftUI
import SwiftData


struct RequestListView: View {
    @Environment(\.modelContext) private var modelContext
    var actor: RequestActor?

    var body: some View {
        Form {
            Text("Request List")
        }
            .navigationTitle("Requests")
            .navigationBarTitleDisplayMode(.large)


    }
}

#Preview {
    let testData = TestData.shared


    RequestListView()
        .modelContext(testData.container.mainContext)

}
