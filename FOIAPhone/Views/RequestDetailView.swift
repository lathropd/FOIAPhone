//
//  RequestDetailView.swift
//  FOIAPhone
//
//  Created by me on 10/24/25.
//

import SwiftUI

struct RequestDetailView: View {
    var data: (any RequestModelProtocol)?
    var actor: RequestActor?
    
    var body: some View {
        Text("Request Details")
    }
}

#Preview {
    RequestDetailView()
}
