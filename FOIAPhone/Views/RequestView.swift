//
//  RequestView.swift
//  FOIAPhone
//
//  Refactored with ViewModel - direct bindings to @Observable properties
//

import SwiftData
import SwiftUI

struct RequestView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var viewModel: RequestViewModel = RequestViewModel()
    
    var request: Request = Request()
    
    @Query(sort: \Jurisdiction.name) private var jurisdictions: [Jurisdiction]
    @Query(filter: #Predicate<Template> { t in t.jurisdictions.count == 0 },
           sort: \Template.name) private var genericTemplates: [Template]
    


    
    var body: some View {
        VStack {
            Form {
                recordsSection
                agencySection
                requestTextSection
                contactSection
                notesSection
            }
            .navigationTitle(viewModel.isNewRequest ? "New Request" : "Request")
            .navigationBarTitleDisplayMode(.large)
            
            actionButtons
        }
        .onAppear {
        
                viewModel.modelContext = modelContext
         
            
        }
    }
    
    // MARK: - View Components
    
    private var recordsSection: some View {
        Section("Records sought") {
            TextEditor(text: $viewModel.request.recordsSought)
                .onChange(of: viewModel.request.recordsSought) {
                    viewModel.handleRecordsSoughtChange()
                }
            
            DatePicker("Date", selection: $viewModel.request.created, displayedComponents: .date)
            
            Picker("Status", selection: $viewModel.request.status) {
                Text("draft").tag(RequestStatus.draft)
                Text("sent").tag(RequestStatus.sent)
                Text("completed").tag(RequestStatus.completed)
                Text("appealed").tag(RequestStatus.appealed)
                Text("denied").tag(RequestStatus.denied)
            }
        }
    }
    
    private var agencySection: some View {
        Section {
            Picker("Jurisdiction", selection: $viewModel.selectedJurisdiction) {
                ForEach(jurisdictions) { jurisdiction in
                    Text(jurisdiction.name).tag(jurisdiction as Jurisdiction?)
                }
            }
            .pickerStyle(.navigationLink)
            
            Picker("Agency", selection: $viewModel.request.agency) {
                ForEach(viewModel.availableAgencies) { agency in
                    Text(agency.name).tag(agency as Agency?)
                }
            }
            .pickerStyle(.navigationLink)
            .onChange(of: viewModel.request.agency) {
                viewModel.handleAgencyChange()
            }
            
            Picker("Template", selection: $viewModel.request.template) {
                ForEach(viewModel.availableTemplates) { template in
                    Text(template.name).tag(template as Template?)
                }
            }
            .pickerStyle(.navigationLink)
        } header: {
            Text("Agency")
        } footer: {
            Text("Statute: \(viewModel.jurisdictionLaw)")
        }
    }
    
    private var requestTextSection: some View {
        Section("Request Text") {
            VStack {
                TextEditor(text: $viewModel.request.text)
                HStack {
                    Spacer()
                    Button("Generate", systemImage: "bolt.horizontal") {
                        viewModel.generateRequestText()
                    }
                    .disabled(!viewModel.canGenerateRequest)
                    .labelStyle(.iconOnly)
                }
            }
        }
    }
    
    private var contactSection: some View {
        Section("FOIA Contact") {
            TextField("Name", text: $viewModel.request.contact)
            TextField("Email", text: $viewModel.request.contactEmail)
            TextField("Phone", text: $viewModel.request.contactPhone)
            TextField("Website", text: $viewModel.request.contactWeb)
            
            Picker("Method", selection: $viewModel.request.method) {
                Text("email").tag(RequestMethod.email)
                Text("web").tag(RequestMethod.web)
                Text("letter").tag(RequestMethod.letter)
                Text("other").tag(RequestMethod.other)
            }
        }
    }
    
    private var notesSection: some View {
        Section("Notes") {
            TextEditor(text: $viewModel.request.notes)
        }
    }
    
    private var actionButtons: some View {
        HStack(spacing: 50) {
            if viewModel.isNewRequest {
                Button("Save") {
                    viewModel.saveRequest()
                }
            }
            
            Button("Delete", role: .destructive) {
                viewModel.deleteRequest {
                    dismiss()
                }
            }
            .disabled(!viewModel.canDelete)
            
            Button("Email") {
                viewModel.sendEmail()
            }
            .disabled(!viewModel.canEmail)
        }
    }
}

#Preview {
    let testData = TestData.shared
    
    

    RequestView()
        .modelContext(testData.container.mainContext)
      

}
