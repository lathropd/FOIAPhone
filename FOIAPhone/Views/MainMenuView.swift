//
//  MainMenuView.swift
//  FOIAPhone
//
//  Created by me on 11/5/25.
//

import SwiftUI
 

struct MainMenuView: View {
//    @Environment(\.pocketBase) var pocketBase
    
    var body: some View {
        ContentView(vm: MainMenuViewModel() )
    }
}




private struct ContentView: View {
    @State var vm: MainMenuViewModel
    

    var body: some View {
        NavigationStack {
            
            
//            List {
            VStack{
                Image("logo")
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(1.4)
                
                    .rotationEffect(.degrees(21))
//                    .offset(y: CGFloat(-100))
                
                HStack {
  
                    
                    NavigationLink(destination: RequestsView()) {
                        
                        
                        Image("viewRequests")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(0.8)
                            .foregroundStyle(.tint)
                    }
                    .accessibilityIdentifier("ViewRequestsButton")
                    
                    NavigationLink(destination: AgenciesView()) {
                        
                        Image("agencies")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(1.1)
                        
                            .foregroundStyle(.tint)
                    }
                    .accessibilityIdentifier("AgenciesButton")
                    
                    
                }
                .offset(y: CGFloat(-100))
                
                
                
                HStack {
//                    Image("templates")
//                        .resizable()
//                        .scaledToFit()
//                        .scaleEffect(0.8)
//                    
//                        .foregroundStyle(.tint)
                    NavigationLink(destination: RequestView()) {
                        Image("newRequest")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(0.8)
                            .foregroundStyle(.tint)

                    }
                    .accessibilityIdentifier("NewRequestButton")
                }
                .offset(y: CGFloat(-100))
                

                   
                HStack{
                    Spacer()

                   
                    Spacer()

                    Spacer()
                    NavigationLink(destination: SettingsView()) {
                        
                        
                        Label("Settings", systemImage: "gear")
                            .tint(.gray)
                            .labelStyle(.iconOnly)
                            .font(.largeTitle)
                            .padding()
                            
                    }
                    .accessibilityIdentifier("SettingsButton")
                    

                }
                .offset(y: CGFloat(-50))

                            
                }.padding()
                


        }
    }
//    }
}

#Preview {
    MainMenuView()
}
