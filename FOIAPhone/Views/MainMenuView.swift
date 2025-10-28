//
//  MainMenuView.swift
//  FOIAPhone
//
//  Created by me on 10/24/25.
//

import SwiftUI

struct MainMenuView: View {
    @State var data: FPData
    
    
    var body: some View {
        NavigationStack{
            
            NavigationLink("New Request", destination: RequestDetailView())
            NavigationLink("View Requests",
                           destination: RequestListView(data: data.requests))
            NavigationLink("Agencies & Jurisdictions", destination: JurisdictionListView(data:data.jurisdictions))
            NavigationLink("Templates",
                           destination:
                            TemplateListView(data:data.templates))
            
            
        }
    }
}

#Preview {
    
    MainMenuView(data: TestData.shared)
}
