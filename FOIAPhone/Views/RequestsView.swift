//
//  RequestsView.swift
//  FOIAPhone
//
//  Created by me on 11/14/25.
//
import SwiftUI



struct RequestsView: View {
    
    @State private var vm = RequestsViewModel()

    
    var body: some View {
        Form {
            
        }.navigationTitle("Requests")
            .navigationBarTitleDisplayMode(.large)

    }
}

#Preview {
    NavigationStack {
        RequestsView()
    }
}
