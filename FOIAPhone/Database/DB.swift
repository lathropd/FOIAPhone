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
    
    init(filename: String)  {
        do {
            let documentsDirectoryURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let url = documentsDirectoryURL.appendingPathComponent(filename)
            self.queue = try! DatabaseQueue(path: url.path)
        } catch {
            print("\(error)")
            self.queue = try! DatabaseQueue()
        }

        
    
        
    }
    
    init(queue: DatabaseQueue) {
        self.queue = queue
    }
    
    
    

    func migrate() throws {
        try FPMigrations(db: self.queue).execute()
    }
    
    
    

}

extension EnvironmentValues {
    @Entry var db: DB = DB(filename: "./foiaphone.db")
}


