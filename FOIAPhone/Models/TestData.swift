//
//  TestData.swift
//  FOIAPhone
//
//  Created by me on 10/25/25.
//

import Foundation
import Fakery

let faker = Faker()

final class TestData {
    var jurisdictions: [Jurisdiction]
    var agencies: [Agency] = []
    var requests: [Request] = []
    var templates: [Template] = []
    let shared = TestData()
    
    init() {
        self.jurisdictions = [
            Jurisdiction(name:"United States",
                         law: "Freedom of Information Act (FOIA)",
                         days: 20),
            Jurisdiction(name:"Florida",
                         law: "Sunshine Law",
                         days: 10)
        ]
        
        for _ in 0...10 {
            let state = faker.address.state()
            self.jurisdictions.append(
                Jurisdiction(
                    name: state,
                    law: "\(state) Public Information Act",
                    days: Int.random(in:10...30)
                ))
        }
        
        for jurisdiction in self.jurisdictions  {
            for _ in 0...10 {
                self.agencies.append(Agency(
                    name: "\(jurisdiction.name!) Department of \(faker.cat.breed())",
                    jurisdiction: jurisdiction,
                    days: jurisdiction.days,
                    contact: faker.name.name(),
                    contactEmail: faker.internet.safeEmail(),
                    contactPhone: faker.phoneNumber.phoneNumber(),
                    contactWeb: "https://\(faker.internet.domainName())/foia"
                ))
            }
        }
        
        for agency in self.agencies {
            for _ in 0...10 {
                self.requests.append(Request(
                    id: nil,
                    agency: agency,
                    contact: agency.contact,
                    contactEmail: agency.contactEmail,
                    contactPhone: agency.contactPhone,
                    contactWeb: agency.contactWeb ?? "",
                    notes: AttributedString(faker.company.bs()),
                    text: AttributedString(faker.company.bs()),
                    method: [RequestMethod.email,
                             RequestMethod.email,
                             RequestMethod.email,
                             RequestMethod.web,
                             RequestMethod.web,
                             RequestMethod.web,
                             RequestMethod.letter,
                             RequestMethod.other].randomElement() ?? RequestMethod.other
                ))
            }
        }
        
        
        
    }
}




