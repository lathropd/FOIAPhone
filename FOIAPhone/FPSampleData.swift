//
//  FPSampleData.swift
//  FOIAPhone
//
//  Generates sample data for used in testing, previews, etc.
//
//  Created by me on 9/26/25.
//

import Foundation
import SwiftData


@MainActor
final class FPSampleData {
  static let shared = FPSampleData()
  let modelContainer: ModelContainer

  private init() {
      do {
          let config = ModelConfiguration(isStoredInMemoryOnly: true)
          modelContainer = try ModelContainer(for: FPRecordRequest.self, FPFile.self, configurations: config)

          // Populate with sample data
          Task {
              await createSampleData()
          }
      } catch {
          fatalError("Failed to create ModelContainer for SampleData: \(error.localizedDescription)")
      }
  }

  private func createSampleData() async {
      let context = modelContainer.mainContext

      // Example: Create and insert sample instances of YourModel
      let item1 = FPRecordRequest(id: UUID())
      let item2 = FPRecordRequest(id: UUID())
      context.insert(item1)
      context.insert(item2)
      
      
      for _ in 1...10 {
          context.insert( FPRecordRequest(id:UUID()))
          context.insert( FPFile(id:UUID()) )
      }

      
      
      // Add more sample data as needed for your previews
  }
}
