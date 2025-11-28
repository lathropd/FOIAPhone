//
//  AgenciesView.swift
//  FOIAPhone
//
//  Created by me on 11/13/25.
//

import SwiftUI

struct AgenciesView: View {
        @Environment(\.db) var db: FPDatabase
        
        var body: some View {
            // inject environment database into the viewmodel

            ContentView(viewModel: AgenciesViewModel(db: db))
        }
        
       
    }
    
private struct ContentView: View {
    @State var viewModel: AgenciesViewModel
    
    
    var body: some View {
        VStack {
            List {
                Section{
                    ForEach(viewModel.agencies) { agency in
                        Text(agency.name)
                    }
                    Button {
                        
                    } label: {
                        Text("+ Add")
                    }
                    
                }
     
                
                Section("Jurisdictions") {
                    
                    Button {
                        
                    } label: {
                        Text("+ Add")
                    }
                    
                }.headerProminence(.increased)

                
                Section(
                    header: Text("Notes"),
                    footer: Text(
                        "Upgrade to FOIA Phone Enterprise for access to a database of agency contact information."
                    ),
                    content: {
                    })
            }
        }.navigationTitle("Agencies")
            .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationStack {
        AgenciesView()

    }
}
