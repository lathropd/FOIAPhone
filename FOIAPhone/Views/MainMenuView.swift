//
//  MainMenuView.swift
//  FOIAPhone
//
//  Created by me on 10/24/25.
//

import SwiftUI
import SwiftData


struct MainMenuView: View {
    @Environment(\.modelContext) private var modelContext
    //@State var data: FPData
    
    
    
    var body: some View {
        NavigationStack{
            List{
                
                NavigationLink("New Request", destination: NewRequestView())
                NavigationLink("View Requests",
                               destination: RequestListView())
                NavigationLink("Agencies & Jurisdictions", destination: JurisdictionListView())
                NavigationLink("Templates",
                               destination:
                                TemplateListView())
            }
            
            
        }
    }
}

#Preview {
    
    MainMenuView()
}
