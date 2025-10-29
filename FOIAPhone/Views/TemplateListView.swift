//
//  TemplateListView.swift
//  FOIAPhone
//
//  Created by me on 10/28/25.
//

import SwiftUI

struct TemplateListView: View {
    @Environment(\.modelContext) private var modelContext
    var actor: TemplateActor?
    
    var body: some View {
        List($data) { $template in
            NavigationLink(template.name, destination: TemplateDetailView(data: $template))
        }
            .navigationTitle("Templates")
            .navigationBarTitleDisplayMode(.large)


    }
}

#Preview {
    @Previewable @State var templates = TestData.shared.templates
    
    TemplateListView(data: $templates)
}
