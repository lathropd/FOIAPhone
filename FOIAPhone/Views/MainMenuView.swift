//
//  MainMenuView.swift
//  FOIAPhone
//
//  Created by me on 10/24/25.
//

import SwiftUI

struct MainMenuView: View {
    @Environment(\.modelContext) private var modelContext
    @State var data: FPData
    
    
    
    var body: some View {
        NavigationStack{
            List{
                
                NavigationLink("New Request", destination: NewRequestView())
                NavigationLink("View Requests",
                               destination: RequestListView(data: $data.requests))
                NavigationLink("Agencies & Jurisdictions", destination: JurisdictionListView(data:$data.jurisdictions))
                NavigationLink("Templates",
                               destination:
                                TemplateListView(data: $data.templates))
            }
            
            
        }
    }
}

#Preview {
    
    MainMenuView(data: TestData.shared)
}
