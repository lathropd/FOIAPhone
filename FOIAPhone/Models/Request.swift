//
//  Request.swift
//  FOIAPhone
//
//  Created by me on 11/5/25.
//


import Foundation

/// The Request struct.
struct Request: Equatable {
    var id: Int64?
    var name: String
    var records: String
    var text: String
    var method: String
    var status: String
    var notes: String
    var sent: Date?
    var agencyId: Int64?
    var templateId: Int64?


}
