//
//  GRDB.swift
//  FOIAPhone
//
//  Created by me on 11/26/25.
//

import Foundation
import GRDB
import SwiftUI

class FPAppData {
    let db: DatabaseQueue
    
    init(filename: String)  {
        do {
            let documentsDirectoryURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let url = documentsDirectoryURL.appendingPathComponent(filename)
            self.db = try! DatabaseQueue(path: url.path)
        } catch {
            print("\(error)")
            self.db = try! DatabaseQueue()
        }

        
    
        
    }
    
    init(queue: DatabaseQueue) {
        self.db = queue
    }
    
    
    

    func migrate() throws {
        try FPMigrations(db: self.db).execute()
    }
    
    
    

}

extension EnvironmentValues {
    @Entry var fp: FPAppData = FPAppData(filename: "./foiaphone.db")
}

protocol FPRecord: Codable, FetchableRecord, MutablePersistableRecord, Identifiable, Equatable {
    var id: Int64? { get set }
}

extension FPRecord {
    mutating func didInsert(with rowID: Int64, for column: String?) {
            id = rowID
        }
}
