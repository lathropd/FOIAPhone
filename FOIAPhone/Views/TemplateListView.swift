//
//  TemplateListView.swift
//  FOIAPhone
//
//  Created by me on 10/28/25.
//

import SwiftUI
import SwiftData


struct TemplateListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var data: [Template]
    var actor: TemplateActor?
    
    var body: some View {
        List(data) { template in
            NavigationLink(template.name, destination: TemplateDetailView(data: template))
        }
            .navigationTitle("Templates")
            .navigationBarTitleDisplayMode(.large)


    }
}

#Preview {
    let testData = TestData.shared

    TemplateListView()
        .modelContext(testData.container.mainContext)

}
