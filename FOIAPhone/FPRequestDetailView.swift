//
//  FPRecordDetailView.swift
//  FOIAPhone
//
//  Created by me on 9/27/25.
//

import SwiftUI
import SwiftData

struct FPRequestDetailView: View {

    var selectedItem: FPRecordRequest? // Track selected item

    var body: some View {
        if selectedItem != nil { // Detail view for selected item
            Text(selectedItem!.title)
        } else {
            ContentUnavailableView("Select an Item", systemImage: "list.bullet.rectangle.portrait")
        }    }
    
}


#Preview {
    FPRequestDetailView()
}

