//
//  AgencyView.swift
//  FOIAPhone
//
//  Created by me on 11/14/25.
//

import SwiftUI


struct AgencyView: View {
    @Environment(\.fp) private var fp: FPAppData
    var agency: Agency?
    
    var body: some View {
        ContentView(viewModel: AgencyViewModel(agency: agency, fp: fp))
    }
    
}

    
private struct ContentView: View {
    
    
    @State var viewModel: AgencyViewModel
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        Form {
            TextField("Name", text: $viewModel.stringg )
            TextField("FOIA Portal", text: $viewModel.stringg)
            TextField("Website", text: $viewModel.stringg)
            TextField("Jurisdiction", text: $viewModel.stringg)

            Section("Contacts") {
                ForEach(viewModel.contacts) { contact in
                    // probably want a fairly complex rendering view
                    // but ... later?
                    VStack {
                        HStack {
                            Text(contact.fname)
                            Text(contact.lname)
                        }
                        Text(contact.title)
                        Text(contact.email)
                        Text(contact.phone)
                        Text(contact.url)
                    }
                }
                Button {
                    // We'll eventully want a contact creation/editing
                    // view
                } label: {
                    Text("+ Add")
                }
                
            }
            
            Section("Requests") {
                
            }
            
            
        }.navigationTitle("Agency")
        .navigationBarTitleDisplayMode(.large)
        
    }
}

#Preview {
    NavigationStack {
        AgencyView()
    }
}
