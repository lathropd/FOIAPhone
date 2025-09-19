//
//  FPModels.swift
//  FOIAPhone
//
//  Starting point for the data getting/setting code/classes. Haven't decided
//  between CloudKit, Supabase, Pocketbase, roll-your-own, and whatever else.
//
//  Decision will also have to do with whether there's a tight integration with
//  Muckrock/FOIAMachine or a looser coupling.
//
//  Meanwhile, implementing models with some fixtures and sticking close to the
//  FOIAMachine model structures for easy mirroring of requests to there since
//  that's a must-have feature.
//
//  Muckrock FOIAMachine models
//  https://github.com/MuckRock/muckrock/blob/master/muckrock/foiamachine/models.py
//
//  Google Gemini translation to Swift using classes for inspiration
//  https://g.co/gemini/share/6b1c08c809b0
//
//  Created by me on 9/19/25.
//


import Foundation


// MARK: - Commenting out untested functions

// A placeholder for a real slugify function.
//private func slugify(_ text: String) -> String {
//    return text.lowercased().replacingOccurrences(of: " ", with: "-")
//}
//

//Generate a new sharing code. This method would also typically save to a database.
//private func generateSharingCode() -> String {
//    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
//    let sharingCode = String((0..<12).map { _ in letters.randomElement()! })
//    return sharingCode
//}



// MARK: - Comment out untested models
//
//// FPRequestStatus
//// An enum representing the status of a FOIA request.
//// It uses a raw value of type String for easy representation.
//// Thanks Gemini!
//enum FPRequestStatus: String, CaseIterable, Codable {
//    case started = "started"
//    // Assuming MR_STATUS is an external list of statuses.
//    // For this example, we'll add a few common ones.
//    case submitted = "submitted"
//    case pending = "pending"
//    case completed = "completed"
//    case denied = "denied"
//    
//    /// A computed property to get the list of statuses that end a request.
//    static var finalStatuses: [FPRequestStatus] {
//        return [.completed, .denied]
//    }
//}
//
//// FPIdentifiableModel
//// A protocol to define common properties for an identifiable object.
////
////
//// Since at some point a backend for the models will be needed
//// it's not terrible and it gives us the ability to serialize/deserialize
//// fro, JSON
////
//protocol FPModel: Codable {
//    var id: UUID { get }                // UUIDs instead of integers.
//}
//
//
//// Actual models
//
//// FPUser
////
//// Making this similar to the django.auth user
//class FPUser: FPModel {
//    let id: UUID
//    let lastName: String
//    let firstName: String
//    let userName: String
//    let profile: FPUserProfile
//    
//    init(lastName: String, firstName: String, userName: String) {
//        self.id = UUID()
//        self.lastName = lastName
//        self.firstName = firstName
//        self.userName = userName
//        self.profile = FPUserProfile()
//    }
//    
//    init(id: UUID) {
//        self.id = UUID()
//        self.lastName = "lastName"
//        self.firstName = "firstName"
//        self.userName = "userName"
//        self.profile = FPUserProfile()
//    }
//
//}
//
//class FPUserProfile: FPModel {
//    let id: UUID
//    // nothing here for now
//    
//    init() {
//        self.id = UUID()
//    }
//    
//    init(id: UUID) {
//        self.id = id
//    }
//}
//
//
//
///// A model for a jurisdiction.
//class FPJurisdiction: FPModel {
//    let id: UUID
//    let name: String
//    let days: Int? // Optional number of days for response.
//    
//    init(name: String, days: Int?) {
//        self.id = UUID()
//        self.name = name
//        self.days = days
//    }
//    
//    init(id: UUID) {
//        self.id = id
//        self.name = "Generic Juridiction"
//        self.days = 30
//    }
//    
//    
//}
//
///// A model for an agency.
//class FPAgency: FPModel {
//    let id: UUID
//    let name: String
//    let jurisdiction: FPJurisdiction
//    
//    init(name: String, jurisdiction: FPJurisdiction) {
//        self.id = UUID()
//        self.name = name
//        self.jurisdiction = jurisdiction
//    }
//    
//    init(id: UUID) {
//        self.id = id
//        self.name = "Generic Agency"
//        self.jurisdiction = FPJurisdiction(id: UUID())
//    }
//}
//
///// A FOIA Machine Communication stores information about an exchange between a user and an agency.
//class FPCommunication: FPModel {
//    let id: UUID
//    let sender: String
//    let receiver: String
//    var subject: String?
//    let message: String
//    let date: Date
//    let received: Bool
//    
//    // In a real app, the `request` would be a weak reference to avoid a retain cycle.
//    // For this example, we'll make it optional.
//    weak var request: FPRecordRequest?
//    
//    init(sender: String, receiver: String, subject: String?, message: String, date: Date, received: Bool) {
//        self.id = UUID()
//        self.sender = sender
//        self.receiver = receiver
//        self.subject = subject
//        self.message = message
//        self.date = date
//        self.received = received
//    }
//}
//
///// A FOIA Machine File stores files that are created in the course of fulfilling a request.
//class FPFile: FPModel {
//    let id: UUID
//    let fileURL: URL
//    var name: String
//    var comment: String?
//    let dateAdded: Date
//    
//    // In a real app, the `communication` would be a weak reference to avoid a retain cycle.
//    // For this example, we'll make it optional.
//    weak var communication: FPCommunication?
//    
//    init(fileURL: URL, name: String, comment: String?) {
//        self.id = UUID()
//        self.fileURL = fileURL
//        self.name = name
//        self.comment = comment
//        self.dateAdded = Date()
//    }
//}
//
///// A FPRecordRequest stores information about the request.
///// Duplicates a ton of logic from FOIAMachine. Mostly commented out until needed and tested.
/////
//class FPRecordRequest: FPModel, CustomStringConvertible {
//    let id: UUID
//    
//    // Properties corresponding to the Python model's fields.
//    let user: FPUser
//    var title: String {
//        didSet {
//            // Automatically update the slug when the title changes.
//            self.slug = slugify(self.title)
//        }
//    }
//    var slug: String
//    let dateCreated: Date
//    var status: FPRequestStatus
//    let requestLanguage: String
//    let jurisdiction: FPJurisdiction?
//    let agency: FPAgency?
//    var sharingCode: String
//    
//    // stub
//    var communications: [FPCommunication] = []
//    
//    // MARK: - Initializer
//    
//    /// Designated initializer for a new FOIA request.
//    init(user: FPUser, title: String, requestLanguage: String?, jurisdiction: FPJurisdiction?, agency: FPAgency?, dateCreated: Date?, status: FPRequestStatus?, sharingCode: String?, slug: String?, id: UUID?) {
//        self.id = id ?? UUID()
//        self.user = user
//        self.title = title
//        self.requestLanguage = requestLanguage ?? "English"
//        self.jurisdiction = jurisdiction ?? FPJurisdiction(id: UUID())
//        self.agency = agency ?? FPAgency(id: UUID())
//        
//        self.dateCreated = dateCreated ?? Date()
//        self.status = .started
//        self.slug = slug ?? slugify(self.title)
//        self.sharingCode = sharingCode ?? generateSharingCode()
//
//    }
//    
//    init(id: UUID) {
//        self.id = id
//        self.user = FPUser(id: UUID())
//        self.title = "Generic Request"
//        self.requestLanguage = "English"
//        self.jurisdiction = FPJurisdiction(id: UUID())
//        self.agency = FPAgency(id: UUID())
//        self.dateCreated = Date()
//        self.status = .started
//        self.slug = slugify(self.title)
//        self.sharingCode = generateSharingCode()
//        
//        
//        
//    }
//    

//
//    // MARK: - Methods
//    
//
//
//    /// The `description` property is the Swift equivalent of Python's `__str__`.
//    var description: String {
//        return self.title
//    }
//    
//    /// Placeholder for a database save operation.
//    func save() {
//        // This is where you would implement logic to save the object
//        // to a database or a remote API.
//        print("Saving \(self.title) to the database...")
//    }
//}
