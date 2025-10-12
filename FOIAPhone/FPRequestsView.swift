//
//  FPMainNavView.swift
//  FOIAPhone
//
//  Created by me on 9/25/25.
//

import SwiftUI
import SwiftData

struct FPRequestsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \FPRecordRequest.dateCreated, order: .reverse) var items: [FPRecordRequest] // Fetch SwiftData objects
    
    var body: some View {
        
        VStack {
            NavigationStack {
                List{
                    ForEach(items){ item in
                        NavigationLink {
                            FPRequestDetailView(selectedItem: item)
                        } label: {
                            VStack(alignment: .leading){
                                Text(item.dateCreated.ISO8601Format())
                                
                                Text("Status: \(item.status)" )
                                Text(item.title)
                                
                                
                            }
                        }
                    }
                }
                
                .navigationTitle("Records Requests")
                .listStyle(.plain)
            }
            HStack(alignment: .center) {
                Text("FOIAPhone")
                    .padding()
                Spacer()
                Button {
                    print("New Button was tapped")
                } label: {
                    Label("New request", systemImage: "plus")
                    
                }
                .padding()
            }
            .padding()
        }
        
    }
}

#Preview {
    FPRequestsView()
        .modelContainer(FPSampleData.shared.modelContainer)
}

