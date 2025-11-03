//
//  RequestListViewModel.swift
//  FOIAPhone
//
//  Created by me on 10/31/25.
//

import SwiftUI
import SwiftData
import Observation

@Observable
class RequestListViewModel {
    // MARK: - Published State
    var requests: [Request]

    // MARK: - Dependencies
    private let modelContext: ModelContext
    //private let emailService: EmailServiceProtocol
    //private var genericTemplates: [Template] = []
    
    
    
    // MARK: - Initialization
    init(
        requests: [Request] = [Request()],
        modelContext: ModelContext
    ) {
        self.requests = requests
        self.modelContext = modelContext
    }
}
