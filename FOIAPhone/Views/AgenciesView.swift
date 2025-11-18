//
//  AgenciesView.swift
//  FOIAPhone
//
//  Created by me on 11/13/25.
//

import SwiftUI

private class AgenciesViewModel: Observable {
    // always going to make this private and expose via a read-only
    // property when necessary
    var model: [Agency] = []
    
    // rght not this can't be edited because there is no
    // setter. To allow edits add a setter or a mutator functions.
    var agencies: [Agency] {
        return self.model
    }
    
    var jurisdictions: [Jurisdiction] {
        return []
    }
    
    func delete(agency: Agency) {
        self.delete(id: agency.id)
    }
    
    func delete(id: String) {
        // CRUD Logic
    }
    
    func delete(jurisdiction: Jurisdiction) {
        self.delete(jurisdictionId: jurisdiction.id)
    }
    
    func delete(jurisdictionId: String) {
        // CRUD Logic
    }


}

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
