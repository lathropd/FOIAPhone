//
//  RequestViewModel.swift
//  FOIAPhone
//
//  View model for managing request state and business logic
//

import SwiftUI
import SwiftData
import Observation


@Observable
class RequestViewModel {
    
    // MARK: - State
    var request: Request
    var selectedJurisdiction: Jurisdiction?
    
    
    // MARK: - Dependencies
    var modelContext: ModelContext?

    
    // MARK: - Computed Properties
    var isNewRequest: Bool {
        request.modelContext == nil
    }
    
    var canDelete: Bool {
        !isNewRequest
    }
    
    var canEmail: Bool {
        !isNewRequest
    }
    
    var canGenerateRequest: Bool {
        !request.recordsSought.isEmpty
    }
    
    var jurisdictionLaw: String {
        selectedJurisdiction?.law ?? ""
    }
    
    var availableAgencies: [Agency] {
        let agencies: [Agency] = (try? self.modelContext?.fetch(FetchDescriptor<Agency>()) ) ?? []
        return selectedJurisdiction?.agencies ?? agencies
        
    }
    
    var availableTemplates: [Template] {
        (selectedJurisdiction?.templates ?? []) 
    }
    
    // MARK: - Initialization
    init(
        request: Request = Request(),
        modelContext: ModelContext? = nil,
        jurisdiction: Jurisdiction? = nil
        
    ) {
        self.request = request
        self.modelContext =  modelContext
        self.selectedJurisdiction = request.agency?.jurisdiction ?? jurisdiction

    }
    
    // MARK: - Actions
    func saveRequest() {
        guard isNewRequest else { return }
        modelContext!.insert(request)
    }
    
    func deleteRequest(onComplete: @escaping () -> Void) {
        guard !isNewRequest else { return }
        modelContext!.delete(request)
        request = Request()
        onComplete()
    }
    
    func sendEmail() {
        guard !isNewRequest else { return }
        request.method = .email
        request.status = .sent
//        emailService.sendRequest(request)
    }
    
    func generateRequestText() {
        guard canGenerateRequest else { return }
        request.generateRequest()
    }
    
    func handleRecordsSoughtChange() {
        if isNewRequest {
            modelContext!.insert(request)
        }
    }
    
    func handleAgencyChange() {
        request.contact = request.agency?.contact ?? ""
        request.contactWeb = request.agency?.contactWeb ?? ""
        request.contactPhone = request.agency?.contactPhone ?? ""
        request.contactEmail = request.agency?.contactEmail ?? ""
    }
}

// MARK: - Email Service Protocol (for testing)
protocol EmailServiceProtocol {
    func sendRequest(_ request: Request)
}

struct EmailService: EmailServiceProtocol {
    func sendRequest(_ request: Request) {
        request.emailRequest()
    }
}
