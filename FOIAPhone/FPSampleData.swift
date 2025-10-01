//
//  FPSampleData.swift
//  FOIAPhone
//
//  Generates sample data for used in testing, previews, etc.
//
//  Created by me on 9/26/25.
//

import Foundation
import SwiftData
import Fakery



private let faker = Faker(locale: "en")

final class FPSampleRecords {
    var recordRequests: [FPRecordRequest] = []
    var files: [FPFile] = []
    var user: [FPUser] = []
    var agencies: [FPAgency] = []
    var jurisdictions: [FPJurisdiction] = []
    var communications: [FPCommunication]  = []
    var userProfiles: [FPUserProfile] = []
    
    
    init() {
        
        
        // Example: Create and insert sample instances of YourModel
        
        // Create fake FPUser
        let fakeUser = FPUser( lastName: faker.name.lastName(),
                               firstName: faker.name.firstName(),
                               userName: faker.internet.username(),
                               profile: FPUserProfile())
        self.user.append(fakeUser)
        
        
        
        // Create fake agencies and jurisdictions
        // create fake federal FOIA
        let fakeFOIA = FPJurisdiction(name: "U.S.", days: 10)
        self.jurisdictions.append(fakeFOIA)
        
        // create fake White House
        let fakeWhiteHouse = FPAgency(name: "The White House", jurisdiction: fakeFOIA)
        self.agencies.append(fakeWhiteHouse)
        
        // create random fake federal agencies
        for _ in 1...20 {
            let fakeAgency = createFakeAgency(jurisdiction: fakeFOIA)
            self.agencies.append(fakeAgency)
        }
        
        // create 10 fake states with fake cities and fake counties
        for _ in 1...1 {
            let fakeState = FPJurisdiction(name: faker.address.state(),
                                           days: [10, 15, 20, 30].randomElement() )
            self.jurisdictions.append(fakeState)
            let fakeGovernor = FPAgency(name: "Gov. " + faker.name.name(), jurisdiction: fakeState)
            self.agencies.append(fakeGovernor)
            
            
            for _ in 1...1 {
                let fakeAgency = createFakeAgency(jurisdiction: fakeState)
                self.agencies.append(fakeAgency)
            }
            
            
            for _ in 1...1 {
                let fakeCity = FPJurisdiction( name:  "City of \(faker.address.city())",
                                               days: fakeState.days,
                                               parent: fakeState)
                self.jurisdictions.append(fakeCity)
                for _ in 1...10 {
                    let fakeAgency = createFakeAgency(jurisdiction: fakeCity)
                    self.agencies.append(fakeAgency)
                }
                let fakeMayor = FPAgency(name: "Mayor " + faker.name.name(),
                                         jurisdiction: fakeCity)
                self.agencies.append(fakeMayor)
            }
            
            for _ in 1...1 {
                let fakeCounty =  FPJurisdiction( name:  faker.address.county(),
                                                  days: fakeState.days,
                                                  parent: fakeState)
                self.jurisdictions.append(fakeCounty)
                
                let fakeSheriff = FPAgency(name: "Sheriff's Office",
                                           jurisdiction: fakeCounty)
                self.agencies.append(fakeSheriff)
                
            }
        }
        
        // create fake records requests
        for _ in 1...10 {
            
            // create a random data
            let calendar = Calendar.current
            var components = DateComponents()
            components.year = [2025, 2024].randomElement()
            components.month = Int.random(in: 1...12)
            components.day = Int.random(in:1...28)
            components.hour = 10
            components.minute = 30
            let requestDate = calendar.date(from: components)
            let requestStatus = [FPRequestStatus.completed,
                                 FPRequestStatus.denied,
                                 FPRequestStatus.pending,
                                 FPRequestStatus.started,
                                 FPRequestStatus.submitted].randomElement()
            
            
            let agency = self.agencies.randomElement()!
            let requesting = ["documents about ",
                              "emails mentioning ",
                              "data on "].randomElement()! + faker.company.bs()
            
            let fakeRequest = FPRecordRequest(user: fakeUser,
                                              title: "Request for " + requesting,
                                              jurisdiction: agency.jurisdiction,
                                              agency: agency,
                                              dateCreated: requestDate,
                                              status: requestStatus)
            self.recordRequests.append(fakeRequest)
        }
        
        
        
        
        
        
        
    }
    
    
}

@MainActor
final class FPSampleData {
    
    let sampleRecords = FPSampleRecords()
    
    static let shared = FPSampleData()
    
    
    let modelContainer: ModelContainer
    
    private init() {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            modelContainer = try ModelContainer(for: FPRecordRequest.self,
                                                FPFile.self,
                                                FPUser.self,
                                                FPAgency.self,
                                                FPJurisdiction.self,
                                                FPCommunication.self,
                                                FPUserProfile.self,
                                                configurations: config)
            
            // Populate with sample data
            Task {
                await createSampleData()
            }
        } catch {
            fatalError("Failed to create ModelContainer for SampleData: \(error.localizedDescription)")
        }
    }
    
    private func createSampleData() async {
        let context = modelContainer.mainContext
        for i in self.sampleRecords.agencies {
            context.insert(i)
        }
        for i in self.sampleRecords.communications {
            context.insert(i)
        }
        for i in self.sampleRecords.files {
            context.insert(i)
        }
        for i in self.sampleRecords.jurisdictions {
            context.insert(i)
        }
        for i in self.sampleRecords.recordRequests {
            context.insert(i)
        }
        for i in self.sampleRecords.user {
            context.insert(i)
        }
        for i in self.sampleRecords.userProfiles {
            context.insert(i)
        }
//
//
//        // Example: Create and insert sample instances of YourModel
//        
//        // Create fake FPUser
//        let fakeUser = FPUser( lastName: faker.name.lastName(),
//                               firstName: faker.name.firstName(),
//                               userName: faker.internet.username(),
//                               profile: FPUserProfile())
//        context.insert(fakeUser)
//        
//        
//        
//        // Create fake agencies and jurisdictions
//        // create fake federal FOIA
//        let fakeFOIA = FPJurisdiction(name: "U.S. FOIA", days: 10)
//        context.insert(fakeFOIA)
//        
//        // create fake White House
//        let fakeWhiteHouse = FPAgency(name: "The White House", jurisdiction: fakeFOIA)
//        context.insert(fakeWhiteHouse)
//        
//        // create random fake federal agencies
//        for _ in 1...20 {
//            let fakeAgency = createFakeAgency(jurisdiction: fakeFOIA)
//            context.insert(fakeAgency)
//        }
//        
//        // create 10 fake states with fake cities and fake counties
//        for _ in 1...10 {
//            let fakeState = FPJurisdiction(name: faker.address.state(),
//                                           days: [10, 15, 20, 30].randomElement() )
//            context.insert(fakeState)
//            let fakeGovernor = FPAgency(name: "Gov. " + faker.name.name(), jurisdiction: fakeState)
//            context.insert(fakeGovernor)
//            
//            
//            for _ in 1...10 {
//                let fakeAgency = createFakeAgency(jurisdiction: fakeState)
//                context.insert(fakeAgency)
//            }
//            
//            
//            for _ in 1...10 {
//                let fakeCity = FPJurisdiction( name:  faker.address.city(),
//                                               days: fakeState.days,
//                                               parent: fakeState)
//                context.insert(fakeCity)
//                for _ in 1...10 {
//                    let fakeAgency = createFakeAgency(jurisdiction: fakeCity)
//                    context.insert(fakeAgency)
//                }
//                let fakeMayor = FPAgency(name: "Mayor " + faker.name.name(),
//                                         jurisdiction: fakeCity)
//                context.insert(fakeMayor)
//            }
//            
//            for _ in 1...10 {
//                let fakeCounty =  FPJurisdiction( name:  faker.address.county(),
//                                                  days: fakeState.days,
//                                                  parent: fakeState)
//                context.insert(fakeCounty)
//                
//                let fakeSheriff = FPAgency(name: fakeCounty.name + "Sheriff's Office",
//                                           jurisdiction: fakeCounty)
//                context.insert(fakeSheriff)
//                
//            }
//        }
//        
//        
//        let agencies = (try? context.fetch(FetchDescriptor<FPAgency>(sortBy: [SortDescriptor(\.name)])))
//        
//        // create fake records requests
//        for _ in 1...5 {
//            
//            // create a random data
//            let calendar = Calendar.current
//            var components = DateComponents()
//            components.year = [2025, 2024].randomElement()
//            components.month = Int.random(in: 1...12)
//            components.day = Int.random(in:1...28)
//            components.hour = 10
//            components.minute = 30
//            let requestDate = calendar.date(from: components)
//            let requestStatus = [FPRequestStatus.completed,
//                                 FPRequestStatus.denied,
//                                 FPRequestStatus.pending,
//                                 FPRequestStatus.started,
//                                 FPRequestStatus.submitted].randomElement()
//            
//            
//            let agency = agencies!.randomElement()!
//            let requesting = ["documents about ",
//                              "emails mentioning ",
//                              "data on "].randomElement()! + faker.company.bs()
//            
//            let fakeRequest = FPRecordRequest(user: fakeUser,
//                                              title: "Request for " + requesting,
//                                              jurisdiction: agency.jurisdiction,
//                                              agency: agency,
//                                              dateCreated: requestDate,
//                                              status: requestStatus)
//            context.insert(fakeRequest)
//        }
//        
        
        
        
        
        
        
    }
}

func createFakeAgency(jurisdiction: FPJurisdiction) -> FPAgency {
    let agencyType = ["Department of ",
                      "Commission on ",
                      "Agency for ",
                      "Office of"].randomElement()!
    let agencyTopic = faker.programmingLanguage.name()
    let agencyName = "\(agencyType) \(agencyTopic)"
    let fakeAgency = FPAgency(name: agencyName, jurisdiction: jurisdiction)
    return fakeAgency
}
