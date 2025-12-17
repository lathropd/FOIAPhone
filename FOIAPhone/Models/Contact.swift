//
//  Contact.swift
//  FOIAPhone
//
//  Created by me on 11/11/25.
//

import Foundation
import GRDB
 
// The Contact struct

struct Contact: FPRecord  {
    var id: Int64?
    var fname: String
    var lname: String
    var primary: Bool
    var title: String
    var email: String
    var phone: String
    var address: String
    var url: String
    var active: Bool
    var agencyId: Int64?


    
    var created: Date
    var updated: Date
    
    
    enum Columns {
        static let id = Column(CodingKeys.id)
        static let fname = Column(CodingKeys.fname)
        static let lname = Column(CodingKeys.lname)
        static let primary = Column(CodingKeys.primary)
        static let title = Column(CodingKeys.title)
        static let email = Column(CodingKeys.email)
        static let address = Column(CodingKeys.address)
        static let url = Column(CodingKeys.url)
        static let active = Column(CodingKeys.active)
        
        
        static let agencyId = Column(CodingKeys.agencyId)


        static let created = Column(CodingKeys.created)
        static let updated = Column(CodingKeys.updated)

        
    }
    
    static let agency = belongsTo(Agency.self)

}
