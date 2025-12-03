//
//  RequestsViewModel.swift
//  FOIAPhone
//
//  Created by me on 11/18/25.
//

import Foundation
 

@Observable
class RequestsViewModel: Observable {
    // always going to make the model private and expose via a read-only
    // property when necessary
    private var data: [Request] = []
    var fp: FPAppData
    
    var requests: [Request] {
        return self.data
    }
    
    func delete(request: Request) {
        
    }
    
    init(requests: [Request] = [], fp: FPAppData) {
        self.data = requests
        self.fp = fp
    }

}
