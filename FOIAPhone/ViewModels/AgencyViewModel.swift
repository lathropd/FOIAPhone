//
//  AgencyViewModel.swift
//  FOIAPhone
//
//  Created by me on 10/31/25.
//

import SwiftUI
import SwiftData
import Observation

@Observable
class AgencyViewModel {
    // MARK: - Published State
    var agency: Agency

    // MARK: - Dependencies
    var modelContext: ModelContext?

    // MARK: - Initialization
    init(
        agency: Agency = Agency(),
        modelContext: ModelContext? = nil
    ) {
        self.agency = agency
        self.modelContext = modelContext
    }
}
