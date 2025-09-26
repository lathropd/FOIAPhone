//
//  FPMainNavView.swift
//  FOIAPhone
//
//  Created by me on 9/25/25.
//

import SwiftUI
import SwiftData

struct FPMainNavView: View {
    @Query private var items: [FPRecordRequest] // Fetch SwiftData objects
    @State private var selectedItem: FPRecordRequest? // Track selected item



    var body: some View {
                NavigationSplitView {
                    List(selection: $selectedItem) { // Sidebar list
                        ForEach(items) { item in
                            NavigationLink(value: item) {
                                Text(item.title)
                            }
                        }
                    }
                    .navigationTitle("Records Requests")
                } detail: {
                        FPRecordDetailView(selectedItem: selectedItem)
                }
            }
    
    }


#Preview {
    FPMainNavView()
        .modelContainer(FPSampleData.shared.modelContainer)
}


struct FPRecordDetailView: View {
    @State var selectedItem: FPRecordRequest? // Track selected item

    var body: some View {
        if let selectedItem { // Detail view for selected item
            Text(selectedItem.title)
        } else {
            ContentUnavailableView("Select an Item", systemImage: "list.bullet.rectangle.portrait")
        }    }
    
}


