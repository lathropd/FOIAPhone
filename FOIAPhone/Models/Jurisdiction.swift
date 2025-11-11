//
//  Juridiction.swift
//  FOIAPhone
//
//  Created by me on 11/5/25.
//


import Foundation
import PocketBase

/// The Jurisdiction struct.
///
struct Jurisdiction: PBIdentifiableCollection {
    var id: String
    var name: String
    var lawName: String
    var muckrockId: Int
    var calendarDays: Int
    var businessDays: Int

    var created: String
    var updated: String

    
}


struct MockJurisdiction: Equatable {
    var id: String?
    var name: String?
    var lawName: String?
    var muckrockId: Int?
    var calendarDays: Int?
    var businessDays: Int?

    var created: String?
    var updated: String?

    
}
