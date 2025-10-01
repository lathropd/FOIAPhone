//
//  FPRecordDetailView.swift
//  FOIAPhone
//
//  Created by me on 9/27/25.
//

import SwiftUI
import SwiftData

struct FPRequestDetailView: View {
    @Bindable var selectedItem: FPRecordRequest // Track selected item
    @Query(sort: \FPAgency.name, order: .forward) var agencies: [FPAgency]
    @Query(sort: \FPJurisdiction.name, order: .forward) var jurisdictions: [FPJurisdiction]


    var body: some View {
  
        NavigationStack {
            VStack{
                Form{
                    Section() {
                        TextField("Title", text:  $selectedItem.requestText)
                        DatePicker("",
                                   selection: $selectedItem.dateCreated,
                                   displayedComponents: .date)
                    } header: {
                        Text("Request title and date")
                    }
                    
        
                    
                    Picker("Jurisdiction", selection: $selectedItem.jurisdiction) {
                        ForEach(jurisdictions) {jurisdiction in
                            Text(jurisdiction.name).tag(jurisdiction)
                        }
                    }.pickerStyle(.navigationLink)
                    
                    Picker("agency", selection: $selectedItem.agency) {
                        ForEach(selectedItem.jurisdiction?.agencies ?? []) {agency in
                            Text(agency.fullName).tag(agency)
                        }
                    }.pickerStyle(.navigationLink)
                    LabeledContent {
                        TextField("language", text: $selectedItem.requestLanguage)
                    } label: {Text("Language")}
                    
                    Section() {
                        TextEditor(text:  $selectedItem.requestText)

                    } header: {
                        Text("Records sought")
                    }
                    
                    
                    Section() {
                        TextEditor(text:  $selectedItem.requestText)

                    } header: {
                        Text("Public Interest")
                    }
                    
                    Section() {
                        TextEditor(text:  $selectedItem.requestText)

                    } header: {
                        Text("Request language")
                    }

               
                    
                    
                }
                
            }
            }.navigationTitle("Request details")
      
    }
}


#Preview {
    var fakeData = FPSampleData.shared
    
    
    FPRequestDetailView(selectedItem: fakeData.sampleRecords.recordRequests[0])
        .modelContext(fakeData.modelContainer.mainContext)
    

}

