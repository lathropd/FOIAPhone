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
            List {
                ForEach(viewModel.requests) { request in
                    NavigationLink(destination:  RequestView(request: request)) {
                        Text(request.title)
                    }
                }
                NavigationLink(destination:  RequestView()) {
                    Button {
                        
                    } label: {
                        Text("+ Add")
                    }
                }
            }
        }.navigationTitle("Requests")
            .navigationBarTitleDisplayMode(.large)

    }
}

#Preview {
    NavigationStack {
        RequestsView()
    }
}
