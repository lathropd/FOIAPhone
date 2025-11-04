//
//  JurisdictionListViewModel.swift
//  FOIAPhone
//
//  Created by me on 10/31/25.
//

import SwiftUI
import SwiftData
import Observation

@Observable
class JurisdictionListViewModel {
    // MARK: - Published State
    var jurisidictions: [Jurisdiction]

    // MARK: - Dependencies
    var modelContext: ModelContext?

    // MARK: - Initialization
    init(
        jurisidictions: [Jurisdiction] = [Jurisdiction()],
        modelContext: ModelContext? = nil
    ) {
        self.jurisidictions = jurisidictions
        self.modelContext = modelContext
    }
}
