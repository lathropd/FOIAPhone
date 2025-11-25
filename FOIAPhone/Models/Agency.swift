//
//  Request.swift
//  FOIAPhone
//
//  Created by me on 11/5/25.
//


import Foundation
 
/// The Agency struct.
///
struct Agency: Codable{
    var id: String
    var name: String
    var foiaPortal: String
    var website: String
    var jurisdictionId: String
    

    var created: String
    var updated: String
    
    


  
}


struct MockAgency: Equatable {
    var id: String?
    var name: String?
    var foiaPortal: String?
    var website: String?
    var juridsictionId: String?

    var created: String?
    var updated: String?
    
    


  
}

