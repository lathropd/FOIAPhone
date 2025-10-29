//
//  FPModels.swift
//  FOIAPhone
//
//  Created by me on 10/29/25.
//

import Foundation



// Removed Codable / Encodable / Decodable since @Model
// Makes those harder. Will fix eventually.
// See: https://www.donnywals.com/making-your-swiftdata-models-codable/
protocol FPModelProtocol: Hashable, Identifiable, Observable, Equatable {
    var id: UUID { get }
    
}

extension FPModelProtocol {
    
    

}

