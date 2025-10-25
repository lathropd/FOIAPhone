//
//  FPNavStackView.swift
//  FOIAPhone
//
//  Created by me on 10/24/25.
//

import SwiftUI

struct FPNavStack: View {
    var body: some View {
        NavigationStack {
            MainMenuView()
        }
        .navigationDestination(for: Request.self) { item in
            RequestDetailView(data: item)
                        }
        .navigationDestination(for: Array<Request>.self) { list in
            RequestListView(data: list)
        }
            
        }
}

#Preview {
    FPNavStack()
}
