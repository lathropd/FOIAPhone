//
//  AgencyView.swift
//  FOIAPhone
//
//  Created by me on 11/4/25.
//

import SwiftData
import SwiftUI

struct AgencyView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var viewModel: AgencyViewModel = AgencyViewModel()
    
    var agency: Agency = Agency()
    
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .onAppear {
                viewModel.agency = agency
                viewModel.modelContext = modelContext
                
        }
    }

}

#Preview {
    AgencyView()
}
