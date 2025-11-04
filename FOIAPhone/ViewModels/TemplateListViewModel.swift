//
//  TemplateListViewModel.swift
//  FOIAPhone
//
//  Created by me on 10/31/25.
//

import SwiftUI
import SwiftData
import Observation

@Observable
class TemplateListViewModel {
    // MARK: - Published State
    var templates: [Template]

    // MARK: - Dependencies
    var modelContext: ModelContext?

    // MARK: - Initialization
    init(
        templates: [Template] = [Template()],
        modelContext: ModelContext? = nil
    ) {
        self.templates = templates
        self.modelContext = modelContext
    }
}
