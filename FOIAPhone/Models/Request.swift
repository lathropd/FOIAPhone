//
//  Request.swift
//  FOIAPhone
//
//  Created by me on 11/5/25.
//


import Foundation
import PocketBase

/// The Request struct.
struct Request: PBIdentifiableCollection {
    var id: String
    var title: String
    var records: String
    var text: String
    var method: String
    var status: String
    var notes: String
    var sent: Date
    var agencyId: String?
    var userId: String
    
    
    


    var created: String
    var updated: String

}

struct MockRequest: Equatable {
    var id: String?
    var title: String?
    var records: String?
    var text: String?
    var method: String?
    var status: String?
    var notes: String?
    var sent: Date?
    var agencyId: String?

    var created: String?
    var updated: String?

}
