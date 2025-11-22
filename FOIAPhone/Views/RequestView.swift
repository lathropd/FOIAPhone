//
//  RequestView.swift
//  FOIAPhone
//
//  Created by me on 11/6/25.
//

import SwiftUI



struct RequestView: View {
    //@Environment(\.appDatabase) var appDatabase
    var request: Request? = nil
    
    var body: some View {
        ContentView(viewModel: RequestViewModel(request: request) )
    }
}


// using technique from GRDB demo to load
// our views
// https://github.com/groue/GRDB.swift/blob/master/Documentation/DemoApps/GRDBDemo/GRDBDemo/Views/PlayersNavigationView.swift
private struct ContentView: View {
    @State var viewModel: RequestViewModel
    var request: Request? = nil

    var body: some View {
        
        Form{
            TextField("Title", text: $viewModel.request.title)
            DatePicker("Date", selection: $viewModel.request.sent, displayedComponents: .date)
            
            //            Picker("jurisdiction", selection: $viewModel.jurisdiction.id) {
            //                Text("Choose Jurisdiction").tag("")
            //            }
            //            Picker("agency", selection: $viewModel.agency.id) {
            //                Text("Choose Agency")
            //            }
            
            
            
            Section("Records") {
                TextEditor(text: $viewModel.request.records)
            }
            
            Section("Request Text") {
                TextEditor(text: $viewModel.request.text)
                    .listRowSeparator(.hidden) // Hide separator for this row
                
                HStack {
                    Spacer()
                    Button("generate", systemImage: "bolt.fill") {
                        print("generate letter")
                        Task {
                            // add spinner
                            print("letter generator task")
                            try? await viewModel.generateLetter()
                            print("generated letter")
                            // cancel spinner
                        }
                        
                    }.labelStyle(.iconOnly)
                }
                
                
                
                Picker("status", selection: $viewModel.request.status) {
                    Text("Choose Status")
                }
                Picker("request method", selection: $viewModel.request.method) {
                    Text("Choose Method")
                }
                
            }
            
            Section("Notes") {
                TextEditor(text: $viewModel.request.notes)
            }
            
            Section("Agency Info") {
                Text(viewModel.agencyInfo)
                HStack {
                    Spacer()
                    Button("Edit", systemImage: "pencil.circle.fill") {
                        //
                    }.labelStyle(.iconOnly)
                    
                }
                .listRowSeparator(.hidden)
                
            }
            Section {
                HStack(alignment: .center) {
                    Button() {
                        
                        
                        viewModel.email()                } label: {
                            Image(systemName:"envelope")
                            Text("Send")
                        }
                        .buttonStyle(.borderless)
                        .disabled(!viewModel.emailable)
                    
                    
                    Spacer()
                    Button() {
                        viewModel.save()
                    } label: {
                        Image( systemName: "opticaldiscdrive")
                        Text("Save")
                    }
                    .buttonStyle(.borderless)
                    .disabled(!viewModel.saveable)
                    
                    
                    Spacer()
                    // Something about the form makes the trash icon blue in a label or shortform button
                    Button( role:.destructive) {
                        viewModel.delete()
                    } label: {
                        Image( systemName: "trash")
                        Text("Delete")
                    }
                    .disabled(!viewModel.deletable)
                    .tint(.red)
                    .buttonStyle(.borderless)
                    
                    
                    
                }
                
                
            }
            
            
            
            
            
        }.navigationTitle(viewModel.navTitle)
            .navigationBarTitleDisplayMode(.large)
        
            
    }
}
    
   



#Preview {
    NavigationStack{
        RequestView()

    }
}
