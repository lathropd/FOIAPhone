//
//  Request.swift
//  FOIAPhone
//
//  Created by me on 11/5/25.
//


import Foundation
import GRDB
 
/// The Agency struct.
///
struct Agency: FPRecord {
    var id: Int32?
    var name: String
    var foiaPortal: String
    var website: String
    var jurisdictionId: Int32
    var muckrockId: Int32?
    
    var hidden: Bool = false


    var created: Date
    var updated: Date
    
    
    enum Columns {
        static let id = Column(CodingKeys.id)
        static let name = Column(CodingKeys.name)
        static let foiaPortal = Column(CodingKeys.foiaPortal)
        static let website = Column(CodingKeys.website)
        static let jurisdictionId = Column(CodingKeys.jurisdictionId)
        static let muckrockId = Column(CodingKeys.muckrockId)

        static let created = Column(CodingKeys.created)
        static let updated = Column(CodingKeys.updated)

        
    }
    
    static let jurisdiction = belongsTo(Jurisdiction.self)
    static let contacts = hasMany(Contact.self)
    static let requests = hasMany(Request.self)



  
}
