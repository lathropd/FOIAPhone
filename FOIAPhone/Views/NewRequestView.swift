//
//  NewRequestView.swift
//  FOIAPhone
//
//  Created by me on 10/24/25.
//

import SwiftUI
import SwiftData


struct NewRequestView: View {
    @Environment(\.modelContext) private var modelContext
    var data: Request?
    var actor: RequestActor?


    
    var body: some View {
        Form{
            Text("New Request")
                
        }.navigationTitle("New Request")
        .navigationBarTitleDisplayMode(.large)

    }
}

#Preview {
    let testData = TestData.shared



    NewRequestView()
        .modelContext(testData.container.mainContext)

}
