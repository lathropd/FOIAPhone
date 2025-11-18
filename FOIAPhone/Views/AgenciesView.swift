//
//  AgenciesView.swift
//  FOIAPhone
//
//  Created by me on 11/13/25.
//

import SwiftUI

struct AgenciesView: View {
    private var vm = AgenciesViewModel()
    
    var body: some View {
        VStack {
            List {
                Text("Hello, World!")
                Section {
                    ForEach(vm.agencies, id: \.id) { agency in
                        Text(agency.name)
                            .font(.title)
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
