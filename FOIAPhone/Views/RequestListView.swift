//
//  RequestListView.swift
//  FOIAPhone
//
//  Created by me on 10/24/25.
//

import SwiftUI

struct RequestListView: View {
    @State var data: [any RequestModelProtocol]
    var actor: RequestActor?

    var body: some View {
        Text("Request List")
    }
}

#Preview {
    RequestListView(
        data:TestData.shared.requests)
}
