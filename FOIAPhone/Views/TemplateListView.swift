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
    @Query var templates: [Template]
    @State private var viewModel: TemplateListViewModel = TemplateListViewModel()
    
    var body: some View {
        Form {
            
            
            List(templates) { template in
                NavigationLink(template.name, destination: TemplateView(template: template))
            }
            .navigationTitle("Templates")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                viewModel.templates = self.templates
                viewModel.modelContext = self.modelContext
                
            }
            Button("New Template", systemImage: "plus") {
                print("Add template")
            }
        }

    }
}

#Preview {
    let testData = TestData.shared

    NavigationView{
        TemplateListView()
    }
        .modelContext(testData.container.mainContext)

}
