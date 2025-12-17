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
            TextField("Name", text: $viewModel.data.name)
            TextField("FOIA Portal", text: $viewModel.data.foiaPortal)
            TextField("Website", text: $viewModel.data.website)
            //TextField("Jurisdiction", text: $viewModel.data.jurisdictionId)

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
                }.disabled(true)
                
            }
            
          
                HStack(alignment: .center) {
                    //                    Button() {
                    //
                    //                        viewModel.email()
                    //                    }
                    //                    label: {
                    //                            Image(systemName:"envelope")
                    //                            Text("Send")
                    //                        }
                    //                        .buttonStyle(.borderless)
                    //                        .disabled(!viewModel.emailable)
                    //
                    
//                    Spacer()
                    Button() {
                        viewModel.save()
                    } label: {
                        Image( systemName: "opticaldiscdrive")
                        Text("Save")
                    }
                    .buttonStyle(.bordered)
                    //                    .disabled(!viewModel.saveable)
                    
                    
                    Spacer()
                    // Something about the form makes the trash icon blue in a label or shortform button
                    Button( role:.destructive) {
                        viewModel.delete()
                        dismiss()
                    } label: {
                        Image( systemName: "trash")
                        Text("Delete")
                    }
                    //                    .disabled(!viewModel.deletable)
                    .tint(.red)
                    .buttonStyle(.bordered)
                    
                    
                    
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
