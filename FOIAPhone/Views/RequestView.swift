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
        ContentView(/*appDatabase: appDatabase,*/ request: request)
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
            TextField("Name", text: $viewModel.name)
            DatePicker("Date", selection: $viewModel.sentDate, displayedComponents: .date)
        
            Picker("jurisdiction", selection: $viewModel.jurisdictionId) {
                Text("Choose Jurisdiction")
            }
            Picker("agency", selection: $viewModel.agencyId) {
                Text("Choose Agency")
            }
            Picker("template", selection: $viewModel.templateId) {
                Text("Choose Template")
            }
           
            
            Section("Records") {
                TextEditor(text: $viewModel.records)
            }
            
            Section("Request Text") {
                TextEditor(text: $viewModel.text)
                    .listRowSeparator(.hidden) // Hide separator for this row

                HStack {
                    Spacer()
                    Button("generate", systemImage: "bolt.fill") {
                        viewModel.generateLetter()
                        
                    }.labelStyle(.iconOnly)
                }

                    
                
                Picker("status", selection: $viewModel.status) {
                    Text("Choose Status")
                }
                Picker("request method", selection: $viewModel.method) {
                    Text("Choose Method")
                }

            }
            
            Section("Notes") {
                    TextEditor(text: $viewModel.notes)
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
        .navigationTitle(viewModel.navTitle)
        .navigationBarTitleDisplayMode(.large)
    

    }
    
    init(/*appDatabase: AppDatabase,*/ request: Request? = nil, agency: Agency? = nil, jurisdiction: Jurisdiction? = nil) {
        _viewModel = State(
            initialValue: RequestViewModel(
//                appDatabase: appDatabase,
                request: request,
                agency: agency, jurisdiction: jurisdiction
            )
        )
    }
    
    
   

}

#Preview {
    NavigationStack{
        RequestView()

    }
}
