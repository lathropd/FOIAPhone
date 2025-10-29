//
//  TemplateDetailView.swift
//  FOIAPhone
//
//  Created by me on 10/28/25.
//

import SwiftUI
import SwiftData


struct TemplateDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @State var data: Template
    var actor: TemplateActor?

    
    var body: some View {
        Form {
            TextField("Name", text: $data.name)
        }    .navigationTitle("Template")
            .navigationBarTitleDisplayMode(.large)


    }
}

#Preview {
    let testData = TestData.shared
    let data = TestRecords.shared.templates[0]

    TemplateDetailView(data: data)
        .modelContext(testData.container.mainContext)

}
