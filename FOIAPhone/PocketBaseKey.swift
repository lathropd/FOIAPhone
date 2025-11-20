//
//  PocketBaseKey.swift
//  FOIAPhone
//
//  Created by me on 11/20/25.
//


import SwiftUI
import PocketBase

private struct PocketBaseKey: EnvironmentKey {
    static let defaultValue = PocketBase(baseURL: "http://127.0.0.1:8090")
}

extension EnvironmentValues {
    var pocketBase: PocketBase {
        get { self[PocketBaseKey.self] }
        set { self[PocketBaseKey.self] = newValue }
    }
}
