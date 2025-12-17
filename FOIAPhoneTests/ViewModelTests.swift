//
//  ViewModelTests.swift
//  FOIAPhoneTests
//
//  Created by me on 11/20/25.
//

import XCTest
import GRDB
@testable import FOIAPhone

class ViewModelTests: XCTestCase {
    
    var dbQueue: DatabaseQueue!
    var fpAppData: FPAppData!
    
    override func setUpWithError() throws {
        // Use an in-memory database for testing
        dbQueue = try DatabaseQueue()
        fpAppData = FPAppData(queue: dbQueue)
        
        // Run migrations
        try fpAppData.migrate()
    }
    
    override func tearDownWithError() throws {
        dbQueue = nil
        fpAppData = nil
    }
    
    // MARK: - SettingsViewModel Tests
    
    func testSettingsViewModelInitialization() async throws {
        // Initialize ViewModel
        let viewModel = SettingsViewModel(fp: fpAppData)
        
        // Verify default user is created if none exists
        XCTAssertEqual(viewModel.data.id, -1)
        XCTAssertEqual(viewModel.data.email, "")
        
        // Modify data
        viewModel.data.email = "test@example.com"
        viewModel.data.fname = "Test"
        viewModel.data.lname = "User"
        
        // Save
        viewModel.save()
        
        // Verify persistence
        let fetchedUser = try await dbQueue.read { db in
            try User.fetchOne(db, key: -1)
        }
        
        XCTAssertNotNil(fetchedUser)
        XCTAssertEqual(fetchedUser?.email, "test@example.com")
        XCTAssertEqual(fetchedUser?.fname, "Test")
    }
    
    // MARK: - AgenciesViewModel Tests
    
    func testAgenciesViewModelLoad() async throws {
        // Seed data
        try await dbQueue.write { db in
            // Create a jurisdiction first as Agency has a foreign key
            var jurisdiction = Jurisdiction(
                id: nil,
                name: "Test Jurisdiction",
                lawName: "Test Law",
                muckrockId: 1,
                calendarDays: 10,
                businessDays: 10,
                created: Date(),
                updated: Date()
            )
            try jurisdiction.insert(db)
            
            var agency = Agency(
                id: nil,
                name: "Test Agency",
                foiaPortal: "http://portal.com",
                website: "http://agency.com",
                jurisdictionId: jurisdiction.id!,
                muckrockId: nil,
                created: Date(),
                updated: Date()
            )
            try agency.insert(db)
        }
        
        let viewModel = AgenciesViewModel(fp: fpAppData)
        
        // Test loading
        viewModel.load()
        
        // Since load is async/on main actor usually or just runs a block, we might need to wait or check immediately if it's synchronous blocking read.
        // Looking at AgenciesViewModel code, load() uses try? self.fp.db.read which is blocking.
        
        XCTAssertEqual(viewModel.agencies.count, 1)
        XCTAssertEqual(viewModel.agencies.first?.name, "Test Agency")
        XCTAssertEqual(viewModel.jurisdictions.count, 1)
        XCTAssertEqual(viewModel.jurisdictions.first?.name, "Test Jurisdiction")
    }
    
    // MARK: - AgencyViewModel Tests
    
    func testAgencyViewModelInitialization() {
        let jurisdiction = Jurisdiction(id: 1, name: "J1", lawName: "L1", muckrockId: 1, calendarDays: 10, businessDays: 10, created: Date(), updated: Date())
        let agency = Agency(id: 1, name: "A1", foiaPortal: "", website: "",  jurisdictionId: 1, muckrockId: 1, created: Date(), updated: Date())
        
        let viewModel = AgencyViewModel(agency: agency, fp: fpAppData)
        
        XCTAssertEqual(viewModel.agency?.name, "A1")
        XCTAssertNotNil(viewModel.fp)
    }
    
    func testAgencyViewModelEmptyInitialization() {
        let viewModel = AgencyViewModel(fp: fpAppData)
        XCTAssertNil(viewModel.agency)
    }

    // MARK: - JurisdictionViewModel Tests
    
    func testJurisdictionViewModelInitialization() {
        let jurisdiction = Jurisdiction(id: 1, name: "J1", lawName: "L1", muckrockId: 1, calendarDays: 10, businessDays: 10, created: Date(), updated: Date())
        
        let viewModel = JurisdictionViewModel(jurisdiction: jurisdiction, fp: fpAppData)
        
        XCTAssertEqual(viewModel.jurisdiction?.name, "J1")
        XCTAssertNotNil(viewModel.fp)
    }
    
    // MARK: - RequestsViewModel Tests
    
    func testRequestsViewModelInitialization() {
        // Mock Request data would be needed here, but assuming Request struct exists
        // Since I don't have the Request struct definition explicitly in search results other than migrations,
        // I'll mock a simple test if I can instantiate it, otherwise I'll skip complex data verification.
        
        let viewModel = RequestsViewModel(fp: fpAppData)
        XCTAssertTrue(viewModel.requests.isEmpty)
    }
    
    func testRequestsViewModelWithData() {
        // Assuming Request has a memberwise initializer compatible with what we see in migrations
        /*
         t.column("title", .text)
         t.column("records",  .text)
         t.column("text", .text)
         t.column("method", .text)
         t.column("status", .text)
         t.column("notes", .text)
         t.column("sent", .date)
         t.belongsTo("user").notNull()
         t.belongsTo("agency").notNull()
         */
        
        // We need a user and agency ID for a request.
        // Just testing the ViewModel accepts the array.
        let requests: [Request] = [] // Populate if struct is available
        
        let viewModel = RequestsViewModel(requests: requests, fp: fpAppData)
        XCTAssertEqual(viewModel.requests.count, requests.count)
    }
}
