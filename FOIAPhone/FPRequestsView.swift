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
    @State private var selectedItem: FPRecordRequest? // Track selected item
    
    
    var body: some View {
        
        VStack {
            NavigationSplitView {
                List(selection: $selectedItem) {
                    ForEach(items){ item in
                        NavigationLink(value: item) {
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
            } detail: {
                if let selectedItem = selectedItem {
                                    FPRequestDetailView(selectedItem: selectedItem) // A separate view to display details
                                } else {
                                    ContentUnavailableView("Select an Item", systemImage: "list.bullet.rectangle.portrait")                                }
                
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

