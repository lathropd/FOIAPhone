//
//  TestData.swift
//  FOIAPhone
//
//  Created by me on 10/25/25.
//

import Fakery
import Foundation
import SwiftData

let faker = Faker()





final class TestRecords {
    var jurisdictions: [Jurisdiction] = []
    var agencies: [Agency] = []
    var requests: [Request] = []
    var templates: [Template] = []
    
    static let shared = TestRecords()

    init() {
        
        self.templates = [
            Template(name: "FOIA"),
            Template(name: "Iowa Public Records Act")
        ]
        
        self.jurisdictions = [
            Jurisdiction(
                name: "United States",
                law: "Freedom of Information Act (FOIA)",
                days: 20
            ),
            Jurisdiction(
                name: "Florida",
                law: "Sunshine Law",
                days: 10
            ),
        ]

        for _ in 0...10 {
            let state = faker.address.state()
            self.jurisdictions.append(
                Jurisdiction(
                    name: state,
                    law: "\(state) Public Information Act",
                    days: Int.random(in: 10...30)
                )
            )
        }

        for jurisdiction in self.jurisdictions {
            for _ in 0...10 {
                self.agencies.append(
                    Agency(
                        name:
                            "\(jurisdiction.name) Department of \(faker.cat.breed())",
                        jurisdiction: jurisdiction,
                        days: jurisdiction.days,
                        contact: faker.name.name(),
                        contactEmail: faker.internet.safeEmail(),
                        contactPhone: faker.phoneNumber.phoneNumber(),
                        contactWeb:
                            "https://\(faker.internet.domainName())/foia"
                    )
                )
            }
        }

        for agency in self.agencies {
            for _ in 0...10 {
                self.requests.append(
                    Request(
                        agency: agency,
                        contact: agency.contact,
                        contactEmail: agency.contactEmail,
                        contactPhone: agency.contactPhone,
                        contactWeb: agency.contactWeb ?? "",
                        notes: String(faker.company.bs()),
                        text: String(faker.company.bs()),
                        method: [
                            RequestMethod.email,
                            RequestMethod.email,
                            RequestMethod.email,
                            RequestMethod.web,
                            RequestMethod.web,
                            RequestMethod.web,
                            RequestMethod.letter,
                            RequestMethod.other,
                        ].randomElement() ?? RequestMethod.other
                    )
                )
            }
        }

    }
}


class TestData {
    let container: ModelContainer
    
    static let shared = TestData()
    
    init() {
        let schema = Schema([Agency.self, Jurisdiction.self, Request.self, Template.self])
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        do {
            self.container = try ModelContainer(for: schema, configurations: [configuration])
        } catch {
            fatalError("Could not create MockData ModelContainer: \(error)")
        }
        self.addTestData()
    }
    
    func addTestData() {
        
        Task { @MainActor in
            
            for jurisdiction in TestRecords.shared.jurisdictions {
                container.mainContext.insert(jurisdiction)
                
            }
            for agency in TestRecords.shared.agencies {
                container.mainContext.insert(agency)
                
            }
            for request in TestRecords.shared.requests {
                container.mainContext.insert(request)
                
            }
            for template in TestRecords.shared.templates {
                container.mainContext.insert(template)

            }
        }
    }
}

