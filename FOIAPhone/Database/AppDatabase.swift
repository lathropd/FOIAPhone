import Foundation
import GRDB
//import os.log

/// The type that provides access to the application database.
///
/// For example:
///
/// ```swift
/// // Create an empty, in-memory, AppDatabase
/// let config = AppDatabase.makeConfiguration()
/// let dbQueue = try DatabaseQueue(configuration: config)
/// let appDatabase = try AppDatabase(dbQueue)
/// ```
struct AppDatabase: Sendable {
    /// Access to the database.
    ///
    /// See <https://swiftpackageindex.com/groue/GRDB.swift/documentation/grdb/databaseconnections>
    private let dbWriter: any DatabaseWriter
    
    /// Creates a `AppDatabase`, and makes sure the database schema
    /// is ready.
    ///
    /// - important: Create the `DatabaseWriter` with a configuration
    ///   returned by ``makeConfiguration(_:)``.
    init(_ dbWriter: any GRDB.DatabaseWriter) throws {
        self.dbWriter = dbWriter
        try migrator.migrate(dbWriter)
    }
}

// MARK: - Database Configuration

extension AppDatabase {
    // Uncomment for enabling SQL logging
    // private static let sqlLogger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "SQL")
    
    /// Returns a database configuration suited for `AppDatabase`.
    ///
    /// - parameter config: A base configuration.
    static func makeConfiguration(_ config: Configuration = Configuration()) -> Configuration {
        // var config = config

        //
        // Add custom SQL functions or collations, if needed:
        // config.prepareDatabase { db in
        //     db.add(function: ...)
        // }
        //
        // Uncomment for enabling SQL logging if the `SQL_TRACE` environment variable is set.
        // See <https://swiftpackageindex.com/groue/GRDB.swift/documentation/grdb/database/trace(options:_:)>
        // if ProcessInfo.processInfo.environment["SQL_TRACE"] != nil {
        //     config.prepareDatabase { db in
        //         let dbName = db.description
        //         db.trace { event in
        //             // Sensitive information (statement arguments) is not
        //             // logged unless config.publicStatementArguments is set
        //             // (see below).
        //             sqlLogger.debug("\(dbName): \(event)")
        //         }
        //     }
        // }
        //
        // #if DEBUG
        // // Protect sensitive information by enabling verbose debugging in
        // // DEBUG builds only.
        // // See <https://swiftpackageindex.com/groue/GRDB.swift/documentation/grdb/configuration/publicstatementarguments>
        // config.publicStatementArguments = true
        // #endif
        
        return config
    }
}

// MARK: - Database Access: Writes
// Will create methods that execute invariant-preserving database transactions.
//
// Good examples at: https://github.com/groue/GRDB.swift/blob/master/Documentation/DemoApps/GRDBDemo/GRDBDemo/Database/AppDatabase.swift
//
// TODO: - Create Database Write Methods
// Currently giving write access to the entire app. With great power comes great
// responsibility.
//
//
//
extension AppDatabase {
    var writer: any GRDB.DatabaseWriter {
        dbWriter
    }
  
}

// MARK: - Database Access: Reads

// This app does not provide any specific reading method, and instead
// gives an unrestricted read-only access to the rest of the application.

extension AppDatabase {
    /// Provides a read-only access to the database.
    var reader: any GRDB.DatabaseReader {
        dbWriter
    }
}
