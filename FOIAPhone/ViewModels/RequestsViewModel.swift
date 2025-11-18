//
//  RequestsViewModel.swift
//  FOIAPhone
//
//  Created by me on 11/18/25.
//

import Foundation
import PocketBase


class RequestsViewModel: Observable {
    // always going to make the model private and expose via a read-only
    // property when necessary
    private var model: [Request] = []
    
    var requests: [Request] {
        return self.model
    }
    
    func delete(request: Request) {
        self.delete(id: request.id)
    }
    
    func delete(id: String) {
        // CRUD logic
    }
}
