//
//  MainMenuView.swift
//  FOIAPhone
//
//  Created by me on 11/5/25.
//

import SwiftUI
import PocketBase


struct MainMenuView: View {
    @Environment(\.pocketBase) var pb
    
    var body: some View {
        ContentView(vm: MainMenuViewModel(pb: pb) )
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
  
                    
                    
                    
                    Image("viewRequests")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.8)
                        .foregroundStyle(.tint)
                    
                    
                    Image("agencies")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(1.1)
                    
                        .foregroundStyle(.tint)
                    
                    
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
