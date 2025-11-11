//
//  User.swift
//  FOIAPhone
//
//  Created by me on 11/11/25.
//


import Foundation
import PocketBase
/// The User  struct.
///
struct User: PBIdentifiableCollection {
 

    var id: String
    var name: String
    var email: String
    var avatar: String
    var verified: Bool
    var prompt: String
   
    var created: String
    var updated: String
    
}
