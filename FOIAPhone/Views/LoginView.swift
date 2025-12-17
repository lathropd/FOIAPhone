//
//  LoginView.swift
//  FOIAPhone
//
//  Created by me on 11/16/25.
//

import SwiftUI
 
struct LoginView: View {
//    @Environment(\.pocketBase) var pocketBase
        
        var body: some View {
            ContentView(vm: LoginViewModel())
        }
    }
    

private struct ContentView: View {
    @State var vm: LoginViewModel
    var body: some View {
        Form{
            Section(){
                TextField("Email address", text: $vm.email)
                    .textInputAutocapitalization(.never) // Prevents auto-capitalization
                    .accessibilityIdentifier("EmailTextField")

                if vm.isAuthenticated != true {
                    SecureField("Password", text: $vm.password)
                        .textInputAutocapitalization(.never) // Prevents auto-capitalization
                        .accessibilityIdentifier("PasswordTextField")
                    
                    Button("Sign In") {
                            vm.login()


                    }
                    .accessibilityIdentifier("SignInButton")
                    
                    Button("Create New Account") {
                        print("create account")
                    }
                    .accessibilityIdentifier("CreateAccountButton")
                } else {
                    Button("Sign out", role:.destructive) {
                        print("sign out")
                        vm.logout()
                    }
                    .accessibilityIdentifier("SignOutButton")
                    
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
