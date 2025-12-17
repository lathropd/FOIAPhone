//
//  RequestView.swift
//  FOIAPhone
//
//  Created by me on 11/6/25.
//

import SwiftUI



struct RequestView: View {
    @Environment(\.fp) var fp: FPAppData
    var request: Request?
    
    var body: some View {
        // inject environment database into the viewmodel

        ContentView(viewModel: RequestViewModel(request: request, fp: fp))
    }
    
   
}


private struct ContentView: View {
    @State var viewModel: RequestViewModel
    @Environment(\.dismiss) var dismiss

    var request: Request? = nil

    var body: some View {
        
        
        Form{
            TextField("Title", text: $viewModel.data.title)
            DatePicker("Date", selection: $viewModel.data.sent, displayedComponents: .date)
            Section("Records") {
                TextEditor(text: $viewModel.data.records)
//            }
//            
//            Section("Agency") {
                Picker("Jurisdiction", selection: $viewModel.jurisdictionId) {
                    // Jurisdictions
                }
                Picker("Agency", selection: $viewModel.data.agencyId) {
                    // Agencies
                }
            }
            
            Section("Request Text") {
                ZStack {
                    VStack {
                        TextEditor(text: $viewModel.data.text)
                            .listRowSeparator(.hidden) // Hide separator for this row
                            .frame(minHeight: 50, maxHeight:200)
                            .disabled(viewModel.letterIsLoading)
                        
                        HStack {
                            Spacer()
                            Button("generate", systemImage: "bolt.fill") {
                                print("generate letter")
                                Task {
                                    // add spinner
                                    print("letter generator task")
                                    await viewModel.generateLetter()
                                    print("generated letter")
                                    // cancel spinner
                                }
                            }.labelStyle(.iconOnly)
                                .buttonStyle(.automatic)
                        }
                    }
                    if (viewModel.letterIsLoading) {
                        ProgressView()
                            .progressViewStyle(.circular)
                            .scaleEffect(1.5) // Make it more visible
                        //.tint(.blue)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                
                Picker("status", selection: $viewModel.data.status) {
                    Text("draft").tag("draft")
                    Text("sent").tag("sent")
                    Text("disclosure in progress").tag("inProgress")
                    Text("fulfilled").tag("fulfilled")
                    Text("fulfilled (partial)").tag("partiallyFulfilled")
                    Text("rejected").tag("rejected")
                    Text("on appeal").tag("onAppeal")
                }
                Picker("request method", selection: $viewModel.data.method) {
                    Text("email").tag("email")
                    Text("online submission").tag("online")
                    Text("muckrock").tag("muckrock")
                    Text("letter").tag("letter")
                    Text("fax").tag("fax")
                    Text("other").tag("other")
                }
            }
            
            Section("Notes") {
                TextEditor(text: $viewModel.data.notes)
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
                        viewModel.email()
                    }
                    label: {
                            Image(systemName:"envelope")
                            Text("Send")
                        }
                        .buttonStyle(.bordered)
                        .disabled(!viewModel.emailable)
                    
                    Spacer()
                    Button() {
                        viewModel.save()
                    } label: {
                        Image( systemName: "opticaldiscdrive")
                        Text("Save")
                    }
                    .buttonStyle(.bordered)
                    .disabled(!viewModel.saveable)
                    
                    Spacer()
                    // Something about the form makes the trash icon blue in a label or shortform button
                    Button( role:.destructive) {
                        viewModel.delete()
                        dismiss()
                    } label: {
                        Image( systemName: "trash")
                        Text("Delete")
                    }
                    .disabled(!viewModel.deletable)
                    .tint(.red)
                    .buttonStyle(.bordered)
                }
                
            }
        }
        .onChange(of: viewModel.data) {}
        .onAppear() {}
        .navigationTitle(viewModel.navTitle)
            .navigationBarTitleDisplayMode(.large)
            .alert(isPresented: $viewModel.alertShows) {
                Alert(
                    title: Text(viewModel.alertTitle),
                    message: Text(viewModel.alertText)
                )
            }
    
        
            
    }
}
    
   



#Preview {
    NavigationStack{
        RequestView()

    }
}
