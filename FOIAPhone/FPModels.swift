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
import SwiftData


// MARK: - Commenting out untested functions

// slugify()
// A placeholder for a real slugify function. Made with ugly regexes.
func fpSlugify(_ text: String) -> String {
    return text.lowercased().replacingOccurrences(of:"\\s", with:"-", options:.regularExpression)
        .replacingOccurrences(of:"\\p{P}", with:"-", options:.regularExpression)
        .replacingOccurrences(of:"\\-+", with: "-", options:.regularExpression)
        .replacingOccurrences(of:"\\-$", with: "", options:.regularExpression)
}


//generateSharingCode()
//Generate a new sharing code. This method would also typically save to a database.
func fpGenerateSharingCode() -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let sharingCode = String((0..<12).map { _ in letters.randomElement()! })
    return sharingCode
}



// MARK: - Comment out untested models
//
// FPRequestStatus
// An enum representing the status of a FOIA request.
// It uses a raw value of type String for easy representation.
// Thanks Gemini!
enum FPRequestStatus: String, CaseIterable, Codable {
    case started = "started"
    // Assuming MR_STATUS is an external list of statuses.
    // For this example, we'll add a few common ones.
    case submitted = "submitted"
    case pending = "pending"
    case completed = "completed"
    case denied = "denied"
    
    /// A computed property to get the list of statuses that end a request.
    static var finalStatuses: [FPRequestStatus] {
        return [.completed, .denied]
    }
}
//
//// FPIdentifiableModel
//// A protocol to define common properties for an identifiable object.
////
////
//// Since at some point a backend for the models will be needed
//// it's not terrible and it gives us the ability to serialize/deserialize
//// fro, JSON
////
protocol FPModel: Identifiable {
    var id: UUID { get }                // UUIDs instead of integers.
    
}


//// Actual models
//
//// FPUser
////
//// Making this similar to the django.auth user
@Model
class FPUser: FPModel {
    var id: UUID
    var lastName: String
    var firstName: String
    var userName: String
    var profile: FPUserProfile  // This is dumb. Probably don't need to follow
                                // this pattern. Here in case I decide to use the
                                // FOIAMachine backend. It's only that way
                                // because of the Django authorization library.
    
    init(id: UUID? = nil, lastName: String, firstName: String, userName: String, profile: FPUserProfile?) {
        self.id = id ?? UUID()
        self.lastName = lastName
        self.firstName = firstName
        self.userName = userName
        self.profile = profile ?? FPUserProfile()
    }
    
//    init(id: UUID) {
//        self.id = UUID()
//        self.lastName = "lastName"
//        self.firstName = "firstName"
//        self.userName = "userName"
//        self.profile = FPUserProfile()
//    }

}

@Model
class FPUserProfile: FPModel {
    var id: UUID
    // nothing here for now
    
    init(id: UUID? = nil) {
        self.id = id ?? UUID()
    }
    
//    init(id: UUID) {
//        self.id = id
//    }
}



///// A model for a jurisdiction.
@Model
class FPJurisdiction: FPModel {
    var id: UUID
    var name: String
    var parent: FPJurisdiction?
//    var muckRockID: String? // optional MuckRock id since muckrock uses integers
    var days: Int? // Optional number of days for response.
    
    @Relationship(inverse: \FPAgency.jurisdiction) var agencies: [FPAgency]?

    init(id: UUID? = nil, name: String, days: Int? = nil, parent: FPJurisdiction? = nil) {
        self.id = id ?? UUID()
        self.name = name
        self.days = days
        self.parent = parent
    }
    
    var description: String {
        return self.name
    }
    
    static func < (lhs: FPJurisdiction, rhs: FPJurisdiction) -> Bool {
        lhs.name > rhs.name // Sorts by popularity in descending order
    }
    
    
//    init(id: UUID) {
//        self.id = id
//        self.name = "Generic Juridiction"
//        self.days = 30
//        self.parent = nil
//    }
//    

    
}

/// A model for an agency.
@Model
class FPAgency: FPModel {
    var id: UUID
    var name: String
    var parentAgency: FPAgency?
    var jurisdiction: FPJurisdiction
    var contactFName: String?
    var contactLName: String?
    var contactTitle: String?
    var contactEmail: String?
    var contactAddress: String?
    var contactCity: String?
    var contactState: String?
    var contactPostalCode: String?
    var contactPhone: String?
    var contactMobile: String?
    var contactNotes: String?
    var agencyFoiaPortal: URL?

    
    init(id: UUID? = nil, name: String,
    
     parentAgency: FPAgency? = nil,
     jurisdiction: FPJurisdiction,
     contactFName: String? = nil,
     contactLName: String? = nil,
     contactTitle: String? = nil,
     contactEmail: String? = nil,
     contactAddress: String? = nil,
     contactCity: String? = nil,
     contactState: String? = nil,
     contactPostalCode: String? = nil,
     contactPhone: String? = nil,
     contactMobile: String? = nil,
     contactNotes: String? = nil,
     agencyFoiaPortal: URL? = nil
         

        ) {
        self.id = id ?? UUID()
        self.name = name
        self.jurisdiction = jurisdiction
        self.parentAgency = parentAgency
        self.contactFName = contactFName
        self.contactLName = contactLName
        self.contactTitle = contactTitle
        self.contactEmail = contactEmail
        self.contactAddress = contactAddress
        self.contactCity = contactCity
        self.contactState = contactState
        self.contactPostalCode = contactPostalCode
        self.contactPhone = contactPhone
        self.contactMobile = contactMobile
        self.contactNotes = contactNotes
        self.agencyFoiaPortal = agencyFoiaPortal
        
    }
    
//    init(id: UUID) {
//        self.id = id
//        self.name = "Generic Agency"
//        self.jurisdiction = FPJurisdiction(id: UUID())
//    }
    
    var fullName: String {

        return "\(self.jurisdiction.name) \(self.name)"
    
    }
    
    var description: String {
        return self.fullName
    }
    
    static func < (lhs: FPAgency, rhs: FPAgency) -> Bool {
        lhs.fullName > rhs.fullName // Sorts by popularity in descending order
    }
}

/// A FOIA Machine Communication stores information about an exchange between a user and an agency.
@Model
class FPCommunication: FPModel {
    var id: UUID
    var sender: String
    var receiver: String
    var subject: String?
    var message: String
    var date: Date
    var received: Bool
    
    // In a real app, the `request` would be a weak reference to avoid a retain cycle.
    // For this example, we'll make it optional.
    weak var request: FPRecordRequest?
    
    init(id: UUID?  = nil, sender: String, receiver: String, subject: String?, message: String, date: Date, received: Bool) {
        self.id = id ?? UUID()
        self.sender = sender
        self.receiver = receiver
        self.subject = subject
        self.message = message
        self.date = date
        self.received = received
    }
    
//    init(id: UUID) {
//        self.id = id
//        self.sender = ["me@mydomain.tld", "somebody@somedomain.tld"].randomElement()!
//        self.receiver = ["foia-officer@fictional.gov", "pio@some-city.ia.us",
//                         "spox@someagency.org"].randomElement()!
//        self.subject = "Re: Records please"
//        self.message = "Generic record request message"
//        self.date = Date()
//        self.received = [true, false].randomElement()!
//    }
}

/// A FOIA Machine File stores files that are created in the course of fulfilling a request.
@Model
class FPFile: FPModel {
    var id: UUID
    var fileURL: URL
    var name: String
    var comment: String?
    var dateAdded: Date
    
    // In a real app, the `communication` would be a weak reference to avoid a retain cycle.
    // For this example, we'll make it optional.
    weak var communication: FPCommunication?
    
    init(id: UUID? = nil, fileURL: URL, name: String, comment: String? = nil) {
        self.id = id ?? UUID()
        self.fileURL = fileURL
        self.name = name
        self.comment = comment
        self.dateAdded = Date()
    }
    
//    init(id: UUID) {
//        self.id = id
//        self.fileURL = URL(fileURLWithPath: "https://file-url.org/some/filename")
//        self.name = "filename.pdf"
//        self.comment = "Some comment"
//        self.dateAdded = Date()
//    }
//    
    
}

/// A FPRecordRequest stores information about the request.
/// Duplicates a ton of logic from FOIAMachine. Mostly commented out until needed and tested.
///

@Model
class FPRecordRequest: FPModel, CustomStringConvertible, Hashable, Identifiable {
    var id: UUID
    
    // Properties corresponding to the Python model's fields.
    var user: FPUser
    var title: String {
        didSet {
            // Automatically update the slug when the title changes.
            self.slug = slugify(self.title)
        }
    }
    var slug: String
    var dateCreated: Date
    var status: FPRequestStatus
    var requestLanguage: String
    var jurisdiction: FPJurisdiction?
    var agency: FPAgency?
    var sharingCode: String
    var requestText: String
    
    // stub
    var communications: [FPCommunication] = []
    
    // MARK: - Initializer
    
    /// Designated initializer for a new FOIA request.
    init(id: UUID? = nil, user: FPUser, title: String, requestLanguage: String? = nil, jurisdiction: FPJurisdiction? = nil, agency: FPAgency, dateCreated: Date? = nil, status: FPRequestStatus? = nil, sharingCode: String? = nil, slug: String? = nil, requestText: String = "") {
        self.id = id ?? UUID()
        self.user = user
        self.title = title
        self.requestLanguage = requestLanguage ?? "English"
        self.jurisdiction = jurisdiction
        self.agency = agency
        self.dateCreated = dateCreated ?? Date()
        self.status = status ?? .started
        self.slug = slug ?? fpSlugify(title)
        self.sharingCode = sharingCode ?? fpGenerateSharingCode()
        self.requestText = requestText

    }
    
//    init(id: UUID) {
//        self.id = id
//        self.user = FPUser(id: UUID())
//        self.title = "Generic Request"
//        self.requestLanguage = "English"
//        self.jurisdiction = FPJurisdiction(id: UUID())
//        self.agency = FPAgency(id: UUID())
//        self.dateCreated = Date()
//        self.status = .started
//        self.sharingCode = generateSharingCode()
//        self.slug = ""
//        
//    }
//    


    // MARK: - Methods
    


    /// The `description` property is the Swift equivalent of Python's `__str__`.
    var description: String {
        return self.title
    }
    
    /// Placeholder for a database save operation.
    func save() {
        // This is where you would implement logic to save the object
        // to a database or a remote API.
        print("Saving \(self.title) to the database...")
    }
    
    static func ==(lhs: FPRecordRequest, rhs: FPRecordRequest) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}



