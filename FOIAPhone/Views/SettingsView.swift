//
//  SettingsView.swift
//  FOIAPhone
//
//  Created by me on 11/13/25.
//

import SwiftUI
import PocketBase



struct SettingsView: View {
    @Environment(\.pocketBase) var pocketBase


    
    var body: some View {
        ContentView(vm: SettingsViewModel(pb: pocketBase))
    }
}

private struct ContentView: View {
    
    @State var vm: SettingsViewModel
    @State private var path = NavigationPath()


    
    var loginScreenLabelText: String {
        return vm.isAuthenticated ? "Account" : "Connect to an account"
    }
    
    var body: some View {
        Form {
            Section("Identity") {
                HStack {
                    TextField("First Name", text: $vm.fname)
                    TextField("Middle",  text: $vm.mi)
                        .frame(width: 50)
                    TextField("Last Name", text: $vm.lname)
                    
                    
                }
                TextField("Title", text: $vm.title)
                TextField("Organization", text: $vm.organization)
                NavigationLink(loginScreenLabelText, destination: LoginView())
                    .foregroundStyle(.blue)
            }
                
            Section("Email Signature"){
                TextEditor(text: $vm.signature)
                    .frame(minHeight:50)

            }
                //.brightness(1.0)

            
        
            
        
            
    
            Section(header: Text("Requester details")
                    

                   
                    
            ) {
                TextEditor(
                    text: $vm.description,
                ).frame(minHeight:50)
            }
                
            Section(
                footer:
                    Text(
                        """
                        Describing your organization and purpose assist with requests \
                        for fee waivers, records access and expedited review.
                        """
                    )
                
            ) {
                    
                    
                Toggle("News Media", isOn: $vm.isMedia)
                Toggle("Nonprofit Organization", isOn: $vm.isNonprofit)
                Toggle("Academic Research", isOn: $vm.isAcademic)
                Toggle("Political Organization", isOn: $vm.isPolitical)
                Toggle("Privacy Act", isOn: $vm.isPrivacyAct)
                Toggle("Litigation", isOn: $vm.isLitigation)


            }
        
            
            Section( header:VStack {
                Text("© 2025 Daniel Lathrop. View the [license](), [credits](), [privacy policy]() and [user agreement]() at [foiaphone.com](https://articlexv.com)")
                    .font(.caption)

            }, content: {})
            
        }.navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            self.vm.updateAuthentication()
            self.vm.loadSettings()
        }
        .onDisappear() {
            self.vm.updateAuthentication()
            self.vm.saveSettings()
        }

    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
