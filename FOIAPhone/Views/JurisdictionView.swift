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
        Form{
            TextField("name", text: $viewModel.jurisdiction.name)
            TextField("statute", text: $viewModel.jurisdiction.law)
            TextField("days agency has to respond", value: $viewModel.jurisdiction.days, format: .number)
                .keyboardType(.numberPad)
                .padding()
            // TODO: Need to make Jurisdiction() defaults look pretty for creating new jurisidiction instead of this mess
            
                Section("Agencies") {
                    ForEach(jurisdiction.agencies) {
                        agency in
                        NavigationLink(destination: AgencyView(agency: agency)) {
                            Text(agency.name)
                        }
                    }
                    Button("Add Agency", systemImage: "plus") {
                        print("Add agency")
                    }
                }
        }
        .onAppear {
                viewModel.jurisdiction = jurisdiction
                viewModel.modelContext = modelContext
        }
        
        
    }
}

#Preview {
    JurisdictionView()
}
