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
    @State private var path = NavigationPath()

    
    
    var body: some View {
  
        NavigationStack(path: $path){
                
                List{
                    
                    
                    NavigationLink("New Request", destination: RequestView())
                    NavigationLink("View Requests",
                                   destination: RequestListView())
                    NavigationLink("Agencies & Jurisdictions", destination: JurisdictionListView())
                    NavigationLink("Templates",
                                   destination:
                                    TemplateListView())
                }.navigationTitle("FOIA Phone")
                .navigationBarTitleDisplayMode(.large)

            }
            
        
        
    }
}

#Preview {
    let testData = TestData.shared
    
    MainMenuView()
        .modelContext(testData.container.mainContext)

}
