//
//  LoginView.swift
//  FOIAPhone
//
//  Created by me on 11/16/25.
//

import SwiftUI
import PocketBase

struct LoginView: View {
        @Environment(\.pocketBase) var pb
        
        var body: some View {
            ContentView(vm: LoginViewModel(pb: pb))
        }
    }
    

private struct ContentView: View {
    @State var vm: LoginViewModel
    var body: some View {
        Form{
            Section(){
                TextField("Email address", text: $vm.password)
                TextField("Password", text: $vm.password)
                
                Button("Sign In") {
                    print("sign in")
                    Task {
                        try await vm.login()
                    }
                }.disabled(vm.signedIn)
                
                Button("Create New Account") {
                    print("create account")
                }.disabled(vm.signedIn)
                
                Button("Sign out", role:.destructive) {
                    print("sign out")
                }.disabled(vm.signedIn ? false : true)
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
