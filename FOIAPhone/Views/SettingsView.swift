//
//  SettingsView.swift
//  FOIAPhone
//
//  Created by me on 11/13/25.
//

import SwiftUI



struct SettingsView: View {
    
    @State private var vm = SettingsViewModel()
    
    
    
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
                NavigationLink(vm.email, destination: LoginView())
                    .foregroundStyle(.blue)
            }
                
            Section("Email Signature"){
                TextEditor(text: $vm.signature)
                    .frame(minHeight:50)
                    .foregroundColor(vm.signatureIsSet ? .primary : .primary.opacity(0.25))
            }
                //.brightness(1.0)

            
        
            
        
            
    
            Section(header: Text("Request augmentation"),
                    footer: Text("Depending on the circumstsances, these may assist with requests for fee waivers and expedited review. Upgrade to FOIA Phone Enterprise to customize these per request.")
                    
            ) {
                TextEditor(
                    text: $vm.description,
                ).frame(minHeight:50)
                    .foregroundColor(vm.descriptionIsSet ? .primary : .primary.opacity(0.25))
                
//            }
//            
//            Section {
                    
                    
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
            

    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
