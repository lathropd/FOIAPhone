//
//  TemplateView.swift
//  FOIAPhone
//
//  Created by me on 11/4/25.
//

import SwiftUI

struct TemplateView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var viewModel: TemplateViewModel = TemplateViewModel()
    
    var template: Template = Template()
    
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .onAppear {
                viewModel.template = template
                viewModel.modelContext = modelContext
                
        }
    }}

#Preview {
    TemplateView()
}
