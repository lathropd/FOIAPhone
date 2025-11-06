//
//  Migrations.swift
//  FOIAPhone
//
//  Created by me on 11/6/25.
//
import Foundation
import GRDB

var migrator: DatabaseMigrator {
    var migrator = DatabaseMigrator()
            
#if DEBUG
    // Speed up development by nuking the database when migrations change
    // See <https://swiftpackageindex.com/groue/GRDB.swift/documentation/grdb/migrations#The-eraseDatabaseOnSchemaChange-Option>
    migrator.eraseDatabaseOnSchemaChange = true
#endif
            
    migrator.registerMigration("v1") { db in
        // See <https://swiftpackageindex.com/groue/GRDB.swift/documentation/grdb/databaseschema>
                
                
        try db.create(table: "jurisdiction") { t in
            t.autoIncrementedPrimaryKey("id")
                    
            t.column("name", .text).notNull()
            t.column("law", .text).notNull()
            // not all jurisdictions will have a hard and fast date
            // so allow days to be nil
            t.column("days", .integer)
                    
            // these should get cleverly handled in the background
            //                t.column("created", .datetime).notNull()
            //                t.column("updated", .datetime).notNull()

        }
                
        try db.create(table: "agency") { t in
            t.autoIncrementedPrimaryKey("id")
                    
            t.column("name", .text).notNull()
            t.column("contact_name", .text)
            t.column("contact_title", .text)
            t.column("contact_email", .text)
            t.column("contact_phone", .text)
            t.column("address", .text)
            t.column("url", .text)
            t.column("foia_url", .text)

            t.belongsTo("jurisdiction", onDelete: .setNull)
                    
            // these should get cleverly handled in the background
            //                t.column("created", .datetime).notNull()
            //                t.column("updated", .datetime).notNull()


        }
                
                
        try db.create(table: "template") { t in
            t.autoIncrementedPrimaryKey("id")
                    
            t.column("name", .text).notNull()
            t.column("text", .text).notNull()
            t.column("hints", .text).notNull()
            t.column("prompt", .text).notNull()

            t.belongsTo("jurisdiction", onDelete: .setNull)

            // these should get cleverly handled in the background
            //                t.column("created", .datetime).notNull()
            //                t.column("updated", .datetime).notNull()

        }
                
                
        try db.create(table: "request") { t in
            t.autoIncrementedPrimaryKey("id")
            t.column("name", .text).notNull()
            t.column("records", .text).notNull()
            t.column("text", .text).notNull()
            t.column("status", .text).notNull()
            t.column("method", .text).notNull()
            t.column("notes", .text).notNull()
            t.column("sent", .datetime)
                    
                    
            t.belongsTo("agency", onDelete: .cascade).notNull()
            t.belongsTo("template", onDelete: .setNull)
                    
            // these should get cleverly handled in the background
            //                t.column("created", .datetime).notNull()
            //                t.column("updated", .datetime).notNull()
                    

        }
    }
            
        
        
    return migrator
}
