//
//  MainMenuView.swift
//  FOIAPhone
//
//  Created by me on 11/5/25.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        NavigationStack {
            
            
//            List {
            VStack{
                Image("logo")
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(1.4)
                
                    .rotationEffect(.degrees(21))
                    .offset(y: CGFloat(-100))
                
                HStack {
                    NavigationLink(destination: RequestView()) {
                        Image("newRequest")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(0.8)
                            .foregroundStyle(.tint)
                    }
                    
                    
                    
                    Image("viewRequests")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.8)
                        .foregroundStyle(.tint)
                    
                    
                }
                .offset(y: CGFloat(-200))
                
                
                
                HStack {
                    Image("templates")
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
                .offset(y: CGFloat(-200))
                
                Text("© 2025 Daniel Lathrop")
                   
                    .foregroundStyle(.red)
                    .offset(y: CGFloat(22))
                   
                HStack{
                    Spacer()
                    
                    Spacer()
                    Button("Settings", systemImage: "gear") {
                        print("navigate to settings")
                        
                    }.tint(.gray)
                        .labelStyle(.iconOnly)
                        .padding()
                    

                }                    .offset(y: CGFloat(-20))
               

            
//                        .labelStyle(.titleAndIcon)
                    
                }.padding()

        }
        }
//    }
}

#Preview {
    MainMenuView()
}
