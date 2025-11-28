//
//  JurisdictionView.swift
//  FOIAPhone
//
//  Created by me on 11/14/25.
//

import SwiftUI


struct JurisdictionView: View {
    @Environment(\.db) private var db: FPDatabase
    var jurisdiction: Jurisdiction?
    
    var body: some View {
        ContentView(viewModel: JurisdictionViewModel(jurisdiction: jurisdiction, db: db))
    }
    
}

    
private struct ContentView: View {
    

    @State var viewModel: JurisdictionViewModel
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
