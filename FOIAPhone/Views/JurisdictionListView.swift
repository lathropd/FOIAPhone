//
//  JurisdictionListView.swift
//  FOIAPhone
//
//  Created by me on 10/28/25.
//

import SwiftUI

struct JurisdictionListView: View {
    @State var data: [(any JurisdictionModelProtocol)]?
    var actor: JursidictionActor?
    
    var body: some View {
        Text("Jurisdction List")
    }
}

#Preview {
    JurisdictionListView()
}
