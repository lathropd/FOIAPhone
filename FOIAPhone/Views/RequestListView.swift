//
//  RequestListView.swift
//  FOIAPhone
//
//  Created by me on 10/24/25.
//

import SwiftData
import SwiftUI

struct RequestListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var requests: [Request]
    @State private var viewModel: RequestListViewModel = RequestListViewModel()

    var body: some View {
        Form {
            List(viewModel.requests) {
                request in
                NavigationLink(destination: RequestView(request: request)) {
                    VStack(alignment: .leading) {
                        Text(request.created.formatted())
                        Text(request.agency?.name ?? "")
                        Text(request.recordsSought)
                        Text("Status: \(request.status)")

                    }
                }

            }
        }
        .navigationTitle("Requests")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.requests = self.requests
            viewModel.modelContext = self.modelContext

        }

    }

}

#Preview {
    let testData = TestData.shared
    NavigationView {
        RequestListView()
            .modelContext(testData.container.mainContext)

    }

}
