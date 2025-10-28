//  AgencyListView.swift
//  FOIAPhone
//
//  Created by me on 10/28/25.
//

import SwiftUI

struct AgencyListView: View {
    @State var data: [(any AgencyModelProtocol)]?
    var actor: AgencyActor?
    
    var body: some View {
        Text("Agency List")
    }
}

#Preview {
    AgencyListView()
}
