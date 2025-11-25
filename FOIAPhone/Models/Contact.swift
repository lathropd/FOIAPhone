//
//  Contact.swift
//  FOIAPhone
//
//  Created by me on 11/11/25.
//

import Foundation
 
// The Contact struct

struct Contact: Codable {
    var id: String
    var fname: String
    var lname: String
    var title: String
    var email: String
    var phone: String
    var address: String
    var url: String
    var active: Bool
    var agencyId: String

    var created: String
    var updated: String
}

struct MockContact: Equatable {
    var id: String?
    var fname: String?
    var lname: String?
    var title: String?
    var email: String?
    var phone: String?
    var address: String?
    var url: String?
    var active: Bool?
    var agencyId: String?

    var created: String?
    var updated: String?
}
