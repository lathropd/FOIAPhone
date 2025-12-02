
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
                t.column("calendarDays", .integer)
                t.column("businessDays", .integer)
                
                
                t.column("created", .datetime)
                t.column("updated", .datetime)
            }
        }

        migrator.registerMigration("Create agency table") { db in
            try db.create(table: "agency") { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("name", .text)
                t.column("foiaPortal", .text)
                t.column("website", .text)
                
                t.column("muckrockId", .integer)

                
                t.belongsTo("jurisdiction").notNull()
                
                
                t.column("updated", .datetime)
                t.column("created", .datetime)
                
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
                
                t.column("updated", .datetime)
                t.column("created", .datetime)
            }
        }
        
        migrator.registerMigration("Create user table") { db in
            try db.create(table: "user") { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("name", .text)
                t.column("email",  .text)
                t.column("method", .text)
                t.column("verified", .boolean)
                
                t.column("updated", .datetime)
                t.column("created", .datetime)
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
                t.column("notes", .text)
                t.column("sent", .date)
                
                t.belongsTo("user").notNull()
                t.belongsTo("agency").notNull()
                
                t.column("updated", .datetime)
                t.column("created", .datetime)
            }
        }
        
        migrator.registerMigration("Add hidden to jurisdiction and agency tables") { db in
            try db.alter(table: "jurisdiction") { t in
                t.add(column: "hidden", .boolean)
            }
            
            try db.alter(table: "agency") { t in
                t.add(column: "hidden", .boolean)
            }
        }
        
        migrator.registerMigration("Add residencyRequirment to jurisdiction table") { db in
            try db.alter(table: "jurisdiction") { t in
                t.add(column: "residencyRequired", .boolean)
            }
        }
        
        migrator.registerMigration("Add fields to user to user table") { db in
            try db.alter(table: "user") { t in
                t.add(column: "newsmedia", .boolean)
                t.add(column: "nonprofit", .boolean)
                t.add(column: "academic", .boolean)
                t.add(column: "political", .boolean)
                t.add(column: "privacyAct", .boolean)
                t.add(column: "litigant", .boolean)
                
                t.rename(column: "name", to: "lname")
                t.add(column: "fname", .text)
                t.add(column: "organization", .text)
                t.add(column: "organizationDescription", .text)
            }
        }
            
        // TODO: Add automatic timestamping at the table level
        
        
        
        
        try migrator.migrate(db)

    }
}

