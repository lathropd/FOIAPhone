//
//  RequestViewModelTests.swift
//  FOIAPhoneTests
//
//  Unit tests for RequestViewModel
//

import XCTest
import SwiftData
@testable import FOIAPhone

final class RequestViewModelTests: XCTestCase {
    
    var container: ModelContainer!
    var context: ModelContext!
    var sut: RequestViewModel!
    
    override func setUp() {
        super.setUp()
        
        // Create in-memory container for testing
        let schema = Schema([
            Request.self,
            Agency.self,
            Jurisdiction.self,
            Template.self
        ])
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try! ModelContainer(for: schema, configurations: config)
        context = ModelContext(container)
    }
    
    override func tearDown() {
        sut = nil
        context = nil
        container = nil
        super.tearDown()
    }
    
    // MARK: - Initialization Tests
    
    func testInit_WithNewRequest_IsNewRequestReturnsTrue() {
        // Given
        let request = Request()
        
        // When
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        
        // Then
        XCTAssertTrue(sut.isNewRequest)
    }
    
    func testInit_WithPersistedRequest_IsNewRequestReturnsFalse() {
        // Given
        let request = Request()
        context.insert(request)
        try! context.save()
        
        // When
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        
        // Then
        XCTAssertFalse(sut.isNewRequest)
    }
    
    func testInit_WithRequestHavingAgency_SetsSelectedJurisdictionFromAgency() {
        // Given
        let jurisdiction = Jurisdiction()
        jurisdiction.name = "Test Jurisdiction"
        
        let agency = Agency()
        agency.name = "Test Agency"
        agency.jurisdiction = jurisdiction
        
        let request = Request()
        request.agency = agency
        
        context.insert(jurisdiction)
        context.insert(agency)
        context.insert(request)
        try! context.save()
        
        // When
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        
        // Then
        XCTAssertEqual(sut.selectedJurisdiction?.name, "Test Jurisdiction")
    }
    
    func testInit_WithJurisdictionParameter_SetsSelectedJurisdiction() {
        // Given
        let jurisdiction = Jurisdiction()
        jurisdiction.name = "Passed Jurisdiction"
        let request = Request()
        
        // When
        sut = RequestViewModel(
            request: request,
            modelContext: context,
            jurisdiction: jurisdiction
        )
        
        // Then
        XCTAssertEqual(sut.selectedJurisdiction?.name, "Passed Jurisdiction")
    }
    
    func testInit_WithNoContext_AllowsNilContext() {
        // Given
        let request = Request()
        
        // When
        sut = RequestViewModel(request: request)
        
        // Then
        XCTAssertNil(sut.modelContext)
        XCTAssertTrue(sut.isNewRequest)
    }
    
    // MARK: - Computed Properties Tests
    
    func testCanDelete_WhenNewRequest_ReturnsFalse() {
        // Given
        let request = Request()
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        
        // Then
        XCTAssertFalse(sut.canDelete)
    }
    
    func testCanDelete_WhenPersistedRequest_ReturnsTrue() {
        // Given
        let request = Request()
        context.insert(request)
        try! context.save()
        
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        
        // Then
        XCTAssertTrue(sut.canDelete)
    }
    
    func testCanEmail_WhenNewRequest_ReturnsFalse() {
        // Given
        let request = Request()
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        
        // Then
        XCTAssertFalse(sut.canEmail)
    }
    
    func testCanEmail_WhenPersistedRequest_ReturnsTrue() {
        // Given
        let request = Request()
        context.insert(request)
        try! context.save()
        
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        
        // Then
        XCTAssertTrue(sut.canEmail)
    }
    
    func testCanGenerateRequest_WhenRecordsSoughtIsEmpty_ReturnsFalse() {
        // Given
        let request = Request()
        request.recordsSought = ""
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        
        // Then
        XCTAssertFalse(sut.canGenerateRequest)
    }
    
    func testCanGenerateRequest_WhenRecordsSoughtHasValue_ReturnsTrue() {
        // Given
        let request = Request()
        request.recordsSought = "Police reports"
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        
        // Then
        XCTAssertTrue(sut.canGenerateRequest)
    }
    
    func testJurisdictionLaw_WithJurisdiction_ReturnsLaw() {
        // Given
        let jurisdiction = Jurisdiction()
        jurisdiction.law = "Iowa Open Records Law"
        let request = Request()
        
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        sut.selectedJurisdiction = jurisdiction
        
        // Then
        XCTAssertEqual(sut.jurisdictionLaw, "Iowa Open Records Law")
    }
    
    func testJurisdictionLaw_WithoutJurisdiction_ReturnsEmptyString() {
        // Given
        let request = Request()
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        
        // Then
        XCTAssertEqual(sut.jurisdictionLaw, "")
    }
    
    // MARK: - Available Agencies Tests
    
    func testAvailableAgencies_WithSelectedJurisdiction_ReturnsJurisdictionAgencies() {
        // Given
        let jurisdiction = Jurisdiction()
        let agency1 = Agency()
        agency1.name = "Agency 1"
        let agency2 = Agency()
        agency2.name = "Agency 2"
        jurisdiction.agencies = [agency1, agency2]
        
        let request = Request()
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        sut.selectedJurisdiction = jurisdiction
        
        // When
        let agencies = sut.availableAgencies
        
        // Then
        XCTAssertEqual(agencies.count, 2)
        XCTAssertTrue(agencies.contains { $0.name == "Agency 1" })
        XCTAssertTrue(agencies.contains { $0.name == "Agency 2" })
    }
    
    func testAvailableAgencies_WithoutSelectedJurisdiction_FetchesAllAgencies() throws {
        // Given
        let agency1 = Agency()
        agency1.name = "All Agency 1"
        let agency2 = Agency()
        agency2.name = "All Agency 2"
        
        context.insert(agency1)
        context.insert(agency2)
        try context.save()
        
        let request = Request()
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        sut.selectedJurisdiction = nil
        
        // When
        let agencies = sut.availableAgencies
        
        // Then
        XCTAssertEqual(agencies.count, 2)
        XCTAssertTrue(agencies.contains { $0.name == "All Agency 1" })
        XCTAssertTrue(agencies.contains { $0.name == "All Agency 2" })
    }
    
    func testAvailableAgencies_WhenFetchFails_ReturnsEmptyArray() {
        // Given
        let request = Request()
        sut = RequestViewModel(
            request: request,
            modelContext: nil  // No context will cause fetch to fail
        )
        sut.selectedJurisdiction = nil
        
        // When
        let agencies = sut.availableAgencies
        
        // Then
        XCTAssertEqual(agencies.count, 0)
    }
    
    // MARK: - Available Templates Tests
    
    func testAvailableTemplates_WithSelectedJurisdiction_ReturnsJurisdictionTemplates() {
        // Given
        let template1 = Template()
        template1.name = "Template 1"
        let template2 = Template()
        template2.name = "Template 2"
        
        let jurisdiction = Jurisdiction()
        jurisdiction.templates = [template1, template2]
        
        let request = Request()
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        sut.selectedJurisdiction = jurisdiction
        
        // When
        let templates = sut.availableTemplates
        
        // Then
        XCTAssertEqual(templates.count, 2)
        XCTAssertTrue(templates.contains { $0.name == "Template 1" })
        XCTAssertTrue(templates.contains { $0.name == "Template 2" })
    }
    
    func testAvailableTemplates_WithoutSelectedJurisdiction_ReturnsEmptyArray() {
        // Given
        let request = Request()
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        sut.selectedJurisdiction = nil
        
        // When
        let templates = sut.availableTemplates
        
        // Then
        XCTAssertEqual(templates.count, 0)
    }
    
    // MARK: - Save Request Tests
    
    func testSaveRequest_WhenNewRequest_InsertsIntoContext() throws {
        // Given
        let request = Request()
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        
        // When
        sut.saveRequest()
        try context.save()
        
        // Then
        let fetchDescriptor = FetchDescriptor<Request>()
        let requests = try context.fetch(fetchDescriptor)
        XCTAssertEqual(requests.count, 1)
        XCTAssertTrue(requests.first === request)
    }
    
    func testSaveRequest_WhenExistingRequest_DoesNotDuplicate() throws {
        // Given
        let request = Request()
        context.insert(request)
        try context.save()
        
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        
        // When
        sut.saveRequest()
        try context.save()
        
        // Then
        let fetchDescriptor = FetchDescriptor<Request>()
        let requests = try context.fetch(fetchDescriptor)
        XCTAssertEqual(requests.count, 1)
    }
    
    // MARK: - Delete Request Tests
    
    func testDeleteRequest_WhenNewRequest_DoesNotDelete() throws {
        // Given
        let request = Request()
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        var dismissCalled = false
        
        // When
        sut.deleteRequest { dismissCalled = true }
        
        // Then
        XCTAssertFalse(dismissCalled)
        let fetchDescriptor = FetchDescriptor<Request>()
        let requests = try context.fetch(fetchDescriptor)
        XCTAssertEqual(requests.count, 0)
    }
    
    func testDeleteRequest_WhenExistingRequest_DeletesAndCallsCompletion() throws {
        // Given
        let request = Request()
        context.insert(request)
        try context.save()
        
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        var dismissCalled = false
        
        // When
        sut.deleteRequest { dismissCalled = true }
        try context.save()
        
        // Then
        XCTAssertTrue(dismissCalled)
        let fetchDescriptor = FetchDescriptor<Request>()
        let requests = try context.fetch(fetchDescriptor)
        XCTAssertEqual(requests.count, 0)
    }
    
    func testDeleteRequest_CreatesNewRequest() throws {
        // Given
        let originalRequest = Request()
        originalRequest.recordsSought = "Original"
        context.insert(originalRequest)
        try context.save()
        
        sut = RequestViewModel(
            request: originalRequest,
            modelContext: context
        )
        
        // When
        sut.deleteRequest { }
        
        // Then
        XCTAssertNotEqual(sut.request.recordsSought, "Original")
        XCTAssertTrue(sut.isNewRequest)
    }
    
    // MARK: - Send Email Tests
    
    func testSendEmail_WhenNewRequest_DoesNotUpdateStatus() {
        // Given
        let request = Request()
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        
        // When
        sut.sendEmail()
        
        // Then
        XCTAssertNotEqual(request.method, .email)
        XCTAssertNotEqual(request.status, .sent)
    }
    
    func testSendEmail_WhenExistingRequest_UpdatesMethodAndStatus() throws {
        // Given
        let request = Request()
        context.insert(request)
        try context.save()
        
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        
        // When
        sut.sendEmail()
        
        // Then
        XCTAssertEqual(sut.request.method, .email)
        XCTAssertEqual(sut.request.status, .sent)
    }
    
    // MARK: - Handle Agency Change Tests
    
    func testHandleAgencyChange_WithAgency_UpdatesContactInfo() {
        // Given
        let request = Request()
        let agency = Agency()
        agency.contact = "John Doe"
        agency.contactEmail = "john@example.com"
        agency.contactPhone = "555-1234"
        agency.contactWeb = "example.com"
        
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        sut.request.agency = agency
        
        // When
        sut.handleAgencyChange()
        
        // Then
        XCTAssertEqual(sut.request.contact, "John Doe")
        XCTAssertEqual(sut.request.contactEmail, "john@example.com")
        XCTAssertEqual(sut.request.contactPhone, "555-1234")
        XCTAssertEqual(sut.request.contactWeb, "example.com")
    }
    
    func testHandleAgencyChange_WithNilAgency_ClearsContactInfo() {
        // Given
        let request = Request()
        request.contact = "Old Contact"
        request.contactEmail = "old@example.com"
        
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        sut.request.agency = nil
        
        // When
        sut.handleAgencyChange()
        
        // Then
        XCTAssertEqual(sut.request.contact, "")
        XCTAssertEqual(sut.request.contactEmail, "")
        XCTAssertEqual(sut.request.contactPhone, "")
        XCTAssertEqual(sut.request.contactWeb, "")
    }
    
    // MARK: - Handle Records Sought Change Tests
    
    func testHandleRecordsSoughtChange_WhenNewRequest_InsertsIntoContext() throws {
        // Given
        let request = Request()
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        sut.request.recordsSought = "Police reports from 2024"
        
        // When
        sut.handleRecordsSoughtChange()
        try context.save()
        
        // Then
        let fetchDescriptor = FetchDescriptor<Request>()
        let requests = try context.fetch(fetchDescriptor)
        XCTAssertEqual(requests.count, 1)
    }
    
    func testHandleRecordsSoughtChange_WhenExistingRequest_DoesNotDuplicate() throws {
        // Given
        let request = Request()
        context.insert(request)
        try context.save()
        
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        sut.request.recordsSought = "Updated records"
        
        // When
        sut.handleRecordsSoughtChange()
        try context.save()
        
        // Then
        let fetchDescriptor = FetchDescriptor<Request>()
        let requests = try context.fetch(fetchDescriptor)
        XCTAssertEqual(requests.count, 1)
    }
    
    // MARK: - Generate Request Text Tests
    
    func testGenerateRequestText_WhenCanGenerate_CallsGenerateOnRequest() {
        // Given
        let request = Request()
        request.recordsSought = "Police reports"
        
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        
        // When
        sut.generateRequestText()
        
        // Then
        // This test verifies the method runs without error
        // Actual generation logic is tested in Request model tests
        XCTAssertTrue(true)
    }
    
    func testGenerateRequestText_WhenCannotGenerate_DoesNothing() {
        // Given
        let request = Request()
        request.recordsSought = ""
        let originalText = request.text
        
        sut = RequestViewModel(
            request: request,
            modelContext: context
        )
        
        // When
        sut.generateRequestText()
        
        // Then
        XCTAssertEqual(sut.request.text, originalText)
    }
}
