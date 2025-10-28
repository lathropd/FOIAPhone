//
//  TemplateListView.swift
//  FOIAPhone
//
//  Created by me on 10/28/25.
//

import SwiftUI

struct TemplateListView: View {
    @State var data: [(any TemplateModelProtocol)]?
    var actor: TemplateActor?
    
    var body: some View {
        Text("Template List")
    }
}

#Preview {
    TemplateListView()
}
