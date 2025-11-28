//
//  AgencyView.swift
//  FOIAPhone
//
//  Created by me on 11/14/25.
//

import SwiftUI


struct AgencyView: View {
    @Environment(\.db) private var db: FPDatabase
    var agency: Agency?
    
    var body: some View {
        ContentView(viewModel: AgencyViewModel(agency: agency, db: db))
    }
    
}

    
private struct ContentView: View {
    

    @State var viewModel: AgencyViewModel
    @Environment(\.dismiss) private var dismiss

    
    var body: some View {
        Form {
            
        }.navigationTitle("Agency")
            .navigationBarTitleDisplayMode(.large)

    }
}

#Preview {
    NavigationStack {
        AgencyView()
    }
}
