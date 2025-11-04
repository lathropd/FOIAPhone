//
//  JurisdictionViewModel.swift
//  FOIAPhone
//
//  Created by me on 10/31/25.
//

import SwiftUI
import SwiftData
import Observation

@Observable
class JurisdictionViewModel {
    // MARK: - Published State
    var jurisdiction: Jurisdiction

    // MARK: - Dependencies
    var modelContext: ModelContext?

    // MARK: - Initialization
    init(
        jurisdiction: Jurisdiction = Jurisdiction(),
        modelContext: ModelContext? = nil
    ) {
        self.jurisdiction = jurisdiction
        self.modelContext = modelContext
    }
}
