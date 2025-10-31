//
//  RequestView.swift
//  FOIAPhone
//
//  Created by me on 10/24/25.
//

// This feels so untestable.

import SwiftData
import SwiftUI

struct RequestView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) var presentationMode
    


    @State var data = Request()
    
    @State private var selectedJurisdiction: Jurisdiction? = nil
    @Query(sort: \Jurisdiction.name) var jurisdictions: [Jurisdiction]
    @Query(filter:#Predicate<Template> { t in t.jurisdictions.count == 0},sort: \Template.name) var genericTemplates: [Template]
    
    var actor: RequestActor?
    
    var body: some View {
        

            Form {
                
                Section(header:Text("Records sought")) {
                    TextEditor(text: $data.recordsSought)
                        .onChange(of: data.recordsSought) {
                            modelContext.insert(data)
                        }
                    
                    DatePicker("Date", selection:$data.created, displayedComponents: .date)
                    Picker("Status", selection:$data.status) {
                        
                        
                        Text("draft").tag(RequestStatus.draft)
                        
                        Text("sent").tag(RequestStatus.sent)
                        
                        
                        Text("completed").tag(RequestStatus.completed)
                        Text("appealed").tag(RequestStatus.appealed)
                        Text("denied").tag(RequestStatus.denied)
                        
                        
                    }
                }
                
                
                
                Section(header:Text("Agency"),
                        footer: Text("Statute: \(selectedJurisdiction?.law ?? "")")
                ) {
                    
                    
                    
                    Picker("Jurisdiction", selection: $selectedJurisdiction) {
                        ForEach(jurisdictions) { jurisdiction in
                            Text(jurisdiction.name).tag(jurisdiction)
                        }
                    }.pickerStyle(.navigationLink)
                    Picker("Agency", selection: $data.agency) {
                        
                        ForEach(selectedJurisdiction?.agencies ?? []) { agency in
                            
                            Text(agency.name).tag(agency as Agency?)
                            
                        }
                    }.pickerStyle(.navigationLink)
                        .onChange(of: data.agency) {
                            
                            data.contact = data.agency?.contact ?? ""
                            data.contactWeb = data.agency?.contactWeb ?? ""
                            data.contactPhone = data.agency?.contactPhone ?? ""
                            data.contactEmail = data.agency?.contactEmail ?? ""
                            
                            
                        }
                    Picker("Template", selection: $data.template) {
                        
                        ForEach(selectedJurisdiction?.templates ?? []) {
                            template in
                            Text(template.name).tag(template as Template?)
                        }
                        
                        
                        ForEach(genericTemplates) {
                            template in
                            Text(template.name).tag(template as Template?)
                        }
                        
                    }.pickerStyle(.navigationLink)
                    
                }
                
                
                
                
                
                
                
                Section(header:Text("Request Text")) {
                    VStack {
                        TextEditor(text: $data.text)
                        HStack {
                            Spacer()
                            Button("Generate", systemImage:"bolt.horizontal") {
                                print("Request text generated")
                                data.generateRequest()
                            }.disabled(data.recordsSought == "" ? true : false )
                                .labelStyle(.iconOnly)
                                                                
                        }
                    }
                }
                
                
                Section(header:Text("FOIA Contact")){
                    TextField("Name", text: $data.contact)
                    TextField("Email", text: $data.contactEmail)
                    TextField("Phone", text: $data.contactPhone)
                    TextField("Website", text: $data.contactWeb)
                    Picker("Method", selection: $data.method) {
                        Text("email").tag(RequestMethod.email)
                        Text("web").tag(RequestMethod.web)
                        Text("letter").tag(RequestMethod.letter)
                        Text("other").tag(RequestMethod.other)
                    }
                    
                }
                
                Section(header:Text("Notes")) {
                    
                    TextEditor(text: $data.notes)
                }
                
                

  
                    
                
                
            }
            .navigationTitle( data.modelContext == nil ? "New Request" : "Request" )
                .navigationBarTitleDisplayMode(.large)
            HStack(spacing:50) {
                if data.modelContext == nil {
                    Button("Save") {
                        // This is the action closure
                        print("Save button tapped!")
                        modelContext.insert(data)
                    }
                } else {
                    Button("Save"){
                        print("this shouldn't be printed")
                    }.hidden()
                }
            
                Button("Delete", role: .destructive) {
                    print("Delete button tapped!")
                    modelContext.delete(data)
                    data = Request()
                    self.presentationMode.wrappedValue.dismiss()

                }.disabled(data.modelContext == nil ? true : false )
                
                Button("Email") {
                    // This is the action closure
                    data.method = .email
                    data.status = .sent
                    data.emailRequest()
                    print("Send button tapped!")
                }.disabled(data.modelContext == nil ? true : false )
        
            }
            
        }
        
    
}

#Preview {
    let testData = TestData.shared
    
    RequestView()
        .modelContext(testData.container.mainContext)
    
}
