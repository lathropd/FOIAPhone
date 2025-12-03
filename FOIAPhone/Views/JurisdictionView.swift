//
//  JurisdictionView.swift
//  FOIAPhone
//
//  Created by me on 11/14/25.
//

import SwiftUI


struct JurisdictionView: View {
    @Environment(\.fp) private var fp: FPAppData
    var jurisdiction: Jurisdiction?
    
    var body: some View {
        ContentView(viewModel: JurisdictionViewModel(jurisdiction: jurisdiction, fp: fp))
    }
    
}

    
private struct ContentView: View {
    

    @State var viewModel: JurisdictionViewModel
    @Environment(\.dismiss) private var dismiss

    
    var body: some View {
        Form {
            TextField("Name", text: $viewModel.stringg )
            TextField("Sunshine Law", text: $viewModel.stringg )
            TextField("Business days to respond", text: $viewModel.stringg )
            TextField("Calendar days to respond", text: $viewModel.stringg )
            Toggle("Residency Requirement", isOn: $viewModel.booleann)
            
            
            Section("Requests") {
                
            }




            
        }.navigationTitle("Jurisdiction")
            .navigationBarTitleDisplayMode(.large)

    }
}

#Preview {
    NavigationStack {
        JurisdictionView()
    }
}
