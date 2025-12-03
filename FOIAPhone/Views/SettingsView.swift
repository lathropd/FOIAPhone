//
//  SettingsView.swift
//  FOIAPhone
//
//  Created by me on 11/13/25.
//

import SwiftUI
 


struct SettingsView: View {
    @Environment(\.fp) var fp: FPAppData


    
    var body: some View {
        ContentView(viewModel: SettingsViewModel(fp: fp))
    }
}

private struct ContentView: View {
    
    @State var viewModel: SettingsViewModel
    
    var body: some View {
        Form {
            
            HStack {
                TextField("First Name", text: $viewModel.data.fname)
                TextField("Middle",  text: $viewModel.data.mi)
                    .frame(width: 50)
                TextField("Last Name", text: $viewModel.data.lname)
            }
            
            
            TextField("Title", text: $viewModel.data.title)
            TextField("Organization", text: $viewModel.data.organization)
            TextField("Email", text: $viewModel.data.email)
            
            
            
            Section("Email Signature"){
                TextEditor(text: $viewModel.data.signature)
                    .frame(minHeight:50)
                
            }
            //.brightness(1.0)
            
            
            
            
            
            
            
            Section(header: Text("Requester details"),
                    
                    footer:
                        Text(
                            """
                            Describing your organization and purpose assist with requests \
                            for fee waivers, records access and expedited review.
                            """
                        )
                    
                    
                    
            ) {
                TextEditor(
                    text: $viewModel.data.description,
                ).frame(minHeight:50)
                
                
                
                Toggle("News Media", isOn: $viewModel.data.media)
                Toggle("Nonprofit Organization", isOn: $viewModel.data.nonprofit)
                Toggle("Academic Research", isOn: $viewModel.data.academic)
                Toggle("Political Organization", isOn: $viewModel.data.political)
                Toggle("Privacy Act", isOn: $viewModel.data.privacyAct)
                Toggle("Litigation", isOn: $viewModel.data.litigant)
                
                
            }
            
            
            Section( header:VStack {
                Text("© 2025 Daniel Lathrop. View the [license](), [credits](), [privacy policy]() and [user agreement]() at [foiaphone.com](https://articlexv.com)")
                    .font(.caption)
                
            }, content: {})
            
        }.onChange(of: viewModel.data) { newData in
            //
            viewModel.save()
//            print("save")
//            print(newData)
        }
        .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
        
        
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
