//
//  TemplateDetailView.swift
//  FOIAPhone
//
//  Created by me on 10/28/25.
//

import SwiftUI

struct TemplateDetailView: View {
    @Binding var data: Template
    var actor: TemplateActor?
    
    var body: some View {
        Form {
            TextField("Name", text: $data.name)
        }    .navigationTitle("Template")
            .navigationBarTitleDisplayMode(.large)


    }
}

#Preview {
    @Previewable @State var template = TestData.shared.templates[0]
    TemplateDetailView(data: $template)
}
