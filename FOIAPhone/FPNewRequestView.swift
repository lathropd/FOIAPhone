//
//  FPNewRequestView.swift
//  FOIAPhone
//
//  Created by me on 10/12/25.
//

import SwiftUI

struct FPNewRequestView: View {
    var body: some View {
        NavigationStack {
            VStack{
                Text("New Request").font(.largeTitle)
                Form{
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}

#Preview {
    FPNewRequestView()
}
