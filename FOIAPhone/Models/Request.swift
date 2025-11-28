//
//  Request.swift
//  FOIAPhone
//
//  Created by me on 11/5/25.
//


import Foundation
import GRDB
 
/// The Request struct.
struct Request: FPRecord {
    var id: Int32?
    var title: String
    var records: String
    var text: String
    var method: String
    var status: String
    var notes: String
    var sent: Date
    var agencyId: Int32?
    var userId: Int32
    
    


    var created: Date
    var updated: Date
    
    enum Columns {
        static let id = Column(CodingKeys.id)
        static let title = Column(CodingKeys.title)
        static let method = Column(CodingKeys.method)
        static let status = Column(CodingKeys.status)
        static let notes = Column(CodingKeys.notes)
        static let sent = Column(CodingKeys.sent)

        static let agencyId = Column(CodingKeys.agencyId)
        static let userId = Column(CodingKeys.userId)


        static let created = Column(CodingKeys.created)
        static let updated = Column(CodingKeys.updated)

        
    }
    
    static let agency = belongsTo(Agency.self)
    static let user = belongsTo(User.self)


}
