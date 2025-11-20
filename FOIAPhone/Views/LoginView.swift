//
//  LoginView.swift
//  FOIAPhone
//
//  Created by me on 11/16/25.
//

import SwiftUI
import PocketBase

struct LoginView: View {
    @Environment(\.pocketBase) var pocketBase
        
        var body: some View {
            ContentView(vm: LoginViewModel(pb: pocketBase))
        }
    }
    

private struct ContentView: View {
    @State var vm: LoginViewModel
    var body: some View {
        Form{
            Section(){
                TextField("Email address", text: $vm.email)
                    .textInputAutocapitalization(.never) // Prevents auto-capitalization

                if vm.isAuthenticated != true {
                    SecureField("Password", text: $vm.password)
                        .textInputAutocapitalization(.never) // Prevents auto-capitalization
                    Button("Sign In") {
                            vm.login()


                    }
                    
                    Button("Create New Account") {
                        print("create account")
                    }
                } else {
                    Button("Sign out", role:.destructive) {
                        print("sign out")
                        vm.logout()
                    }
                    
                }
       

                

                

            }.headerProminence(.standard)


        }
        .navigationTitle("FOIA Phone Account")
        .navigationBarTitleDisplayMode(.large)
        .alert(vm.messageTitle, isPresented: $vm.messageIsPresented ) {
            // no custom actions
        }
        message: {
            Text(vm.messageText)
        }
    }
    
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
