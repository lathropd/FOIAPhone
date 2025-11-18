//
//  AgencyView.swift
//  FOIAPhone
//
//  Created by me on 11/14/25.
//

import SwiftUI


struct AgencyView: View {
    
    @State private var vm = AgencyViewModel()
    @Environment(\.dismiss) private var dismiss

    
    var body: some View {
        Form {
            
        }.navigationTitle("Agency")
            .navigationBarTitleDisplayMode(.large)

    }
}

#Preview {
    NavigationStack {
        AgencyView()
    }
}
