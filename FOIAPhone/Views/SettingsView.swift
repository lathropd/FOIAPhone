//
//  SettingsView.swift
//  FOIAPhone
//
//  Created by me on 11/13/25.
//

import SwiftUI
 


struct SettingsView: View {
//    @Environment(\.db) var FPDatabase


    
    var body: some View {
        ContentView(viewModel: SettingsViewModel())
    }
}

private struct ContentView: View {
    
    @State var viewModel: SettingsViewModel
    @State private var path = NavigationPath()


    

    
    var body: some View {
        Form {
            Section("Identity") {
                HStack {
                    TextField("First Name", text: $viewModel.fname)
                    TextField("Middle",  text: $viewModel.mi)
                        .frame(width: 50)
                    TextField("Last Name", text: $viewModel.lname)
                    
                    
                }
                TextField("Title", text: $viewModel.title)
                TextField("Organization", text: $viewModel.organization)
                TextField("Email", text: $viewModel.email)

                }
                
            Section("Email Signature"){
                TextEditor(text: $viewModel.signature)
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
                    text: $viewModel.description,
                ).frame(minHeight:50)
          
                    
                    
                Toggle("News Media", isOn: $viewModel.isMedia)
                Toggle("Nonprofit Organization", isOn: $viewModel.isNonprofit)
                Toggle("Academic Research", isOn: $viewModel.isAcademic)
                Toggle("Political Organization", isOn: $viewModel.isPolitical)
                Toggle("Privacy Act", isOn: $viewModel.isPrivacyAct)
                Toggle("Litigation", isOn: $viewModel.isLitigation)


            }
        
            
            Section( header:VStack {
                Text("© 2025 Daniel Lathrop. View the [license](), [credits](), [privacy policy]() and [user agreement]() at [foiaphone.com](https://articlexv.com)")
                    .font(.caption)

            }, content: {})
            
        }.navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            self.viewModel.updateAuthentication()
            self.viewModel.loadSettings()
        }
        .onDisappear() {
            self.viewModel.updateAuthentication()
            self.viewModel.saveSettings()
        }

    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
