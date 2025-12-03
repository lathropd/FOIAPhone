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
//            }
//            
//            Section("Agency") {
                Picker("Jurisdiction", selection: $viewModel.jurisdictionId) {
                    
                }
                Picker("Agency", selection: $viewModel.request.agencyId) {
                    
                }
            }
            
            Section("Request Text") {
                
                ZStack {
                    VStack {
                        
                        TextEditor(text: $viewModel.request.text)
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
                
                
                
                Picker("status", selection: $viewModel.request.status) {
                    Text("draft").tag("draft")
                    Text("sent").tag("sent")
                    Text("disclosure in progress").tag("inProgress")
                    Text("fulfilled").tag("fulfilled")
                    Text("fulfilled (partial)").tag("partiallyFulfilled")
                    Text("rejected").tag("rejected")
                    Text("on appeal").tag("onAppeal")



                }
                Picker("request method", selection: $viewModel.request.method) {
                    Text("email").tag("email")
                    Text("online submission").tag("online")
                    Text("muckrock").tag("muckrock")
                    Text("letter").tag("letter")
                    Text("fax").tag("fax")
                    Text("other").tag("other")
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
                        
                        viewModel.email()
                    }
                    label: {
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
                        dismiss()
                    } label: {
                        Image( systemName: "trash")
                        Text("Delete")
                    }
                    .disabled(!viewModel.deletable)
                    .tint(.red)
                    .buttonStyle(.borderless)
                    
                    
                    
                }
                
                
            }
            
            
            
            
            
        }.onChange(of: viewModel.data) { newData in
            
        }
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
