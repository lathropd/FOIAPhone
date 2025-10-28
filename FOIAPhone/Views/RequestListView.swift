//
//  RequestListView.swift
//  FOIAPhone
//
//  Created by me on 10/24/25.
//

import SwiftUI

struct RequestListView: View {
    @Binding var data: [Request]
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
    @Previewable @State var requests = TestData.shared.requests

    RequestListView(
        data: $requests)
}
