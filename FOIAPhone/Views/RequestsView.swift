//
//  RequestsView.swift
//  FOIAPhone
//
//  Created by me on 11/14/25.
//
import SwiftUI


struct RequestsView: View {
        @Environment(\.db) var db: FPDatabase
        
        var body: some View {
            // inject environment database into the viewmodel

            ContentView(viewModel: RequestsViewModel(db: db))
        }
        
       
    }
    
private struct ContentView: View {
    @State var viewModel: RequestsViewModel

    
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
