
//
//  Agency.swift
//  FOIAPhone
//
//  Created by me on 11/5/25.
//


import Foundation
import GRDB
 
///
///
// TODO: Will need to add a uuid field for purposes of migrations later when creating server side element
//


struct FPMigrations {
    
    var db: DatabaseQueue
    
    func execute() throws {
        var migrator = DatabaseMigrator()
        
        migrator.registerMigration("Create jurisdiction table") { db in
            try db.create(table: "jurisdiction") { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("name", .text)
                t.column("lawName",  .text)
                t.column("muckrockId", .integer)
                t.column("email", .text)
                t.column("calendarDays", .integer)
                t.column("businessDays", .integer)
                
                
                t.column("createdDate", .datetime)
                t.column("updatedDate", .datetime)
            }
        }

        migrator.registerMigration("Create agency table") { db in
            try db.create(table: "agency") { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("name", .text)
                t.column("foiaPortal", .text)
                t.column("website", .text)
                
                
                t.belongsTo("jurisdiction").notNull()
                
                
                t.column("updateDate", .datetime)
                t.column("creationDate", .datetime)
                
            }
        }
        
        migrator.registerMigration("Create contact table") { db in
            try db.create(table: "contact") { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("fname", .text)
                t.column("lname",  .text)
                t.column("primary", .boolean)
                t.column("title", .text)
                t.column("email", .text)
                t.column("phone", .text)
                t.column("address", .text)
                t.column("url", .text)
                t.column("active", .boolean)
                
                t.belongsTo("agency").notNull()
                
                t.column("createdDate", .datetime)
                t.column("updatedDate", .datetime)
            }
        }
        
        migrator.registerMigration("Create user table") { db in
            try db.create(table: "user") { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("name", .text)
                t.column("email",  .text)
                t.column("method", .text)
                t.column("verified", .boolean)
                
                t.column("createdDate", .datetime)
                t.column("updatedDate", .datetime)
            }
        }
        
        migrator.registerMigration("Create request table") { db in
            try db.create(table: "request") { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("title", .text)
                t.column("records",  .text)
                t.column("text", .text)
                t.column("method", .text)
                t.column("status", .text)
                t.column("sent", .date)
                t.column("businessDays", .integer)
                
                t.belongsTo("user").notNull()
                t.belongsTo("agency").notNull()
                
                t.column("createdDate", .datetime)
                t.column("updatedDate", .datetime)
            }
        }
        
        
        
        
        
        
        try migrator.migrate(db)

    }
}

