//
//  GRDB.swift
//  FOIAPhone
//
//  Created by me on 11/26/25.
//

import Foundation
import GRDB
import SwiftUI

class DB {
    let queue: DatabaseQueue
    
    init(filename: String) {
        self.queue = try! DatabaseQueue(path: filename)
        
    }
    
    init(queue: DatabaseQueue) {
        self.queue = queue

    }
    

}

extension EnvironmentValues {
    @Entry var db: DB = DB(filename: "foiaphone.db")
}


