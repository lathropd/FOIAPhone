//
//  JurisdictionView.swift
//  FOIAPhone
//
//  Created by me on 11/4/25.
//

import SwiftData
import SwiftUI

struct JurisdictionView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var viewModel: JurisdictionViewModel = JurisdictionViewModel()
    
    var jurisdiction: Jurisdiction = Jurisdiction()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    JurisdictionView()
}
