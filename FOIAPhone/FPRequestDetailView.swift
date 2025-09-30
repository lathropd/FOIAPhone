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
    
    
    var body: some View {
  
            NavigationStack {
                Form{
                    TextField("request title", text: $selectedItem.title)
                }
            }
      
    }
}


