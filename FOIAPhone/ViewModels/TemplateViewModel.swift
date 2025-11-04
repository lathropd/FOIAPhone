//
//  TemplateViewModel.swift
//  FOIAPhone
//
//  Created by me on 10/31/25.
//

import SwiftUI
import SwiftData
import Observation

@Observable
class TemplateViewModel {
    // MARK: - Published State
    var template: Template

    // MARK: - Dependencies
    var modelContext: ModelContext?

    // MARK: - Initialization
    init(
        template: Template = Template(),
        modelContext: ModelContext? = nil
    ) {
        self.template = template
        self.modelContext = modelContext
    }
}
