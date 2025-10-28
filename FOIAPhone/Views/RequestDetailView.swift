//
//  RequestDetailView.swift
//  FOIAPhone
//
//  Created by me on 10/24/25.
//

import SwiftUI

struct RequestDetailView: View {
    @Binding var data: Request
    var actor: RequestActor?
    
    var body: some View {
        Form{
            Text("Request Details")
                
        }.navigationTitle("Request")
        .navigationBarTitleDisplayMode(.large)

    }
}

#Preview {
    @Previewable @State var request = TestData.shared.requests[0]

    RequestDetailView(
        data: $request)
}
