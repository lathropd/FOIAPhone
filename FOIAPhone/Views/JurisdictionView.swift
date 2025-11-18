//
//  JurisdictionView.swift
//  FOIAPhone
//
//  Created by me on 11/14/25.
//

import SwiftUI



struct JurisdictionView: View {
    
    @State private var vm = JurisdictionViewModel()
    @Environment(\.dismiss) private var dismiss

    
    var body: some View {
        Form {
            
        }.navigationTitle("Jurisdiction")
            .navigationBarTitleDisplayMode(.large)

    }
}

#Preview {
    NavigationStack {
        JurisdictionView()
    }
}
