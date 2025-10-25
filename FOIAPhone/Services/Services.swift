//
//  Services.swift
//  FOIAPhone
//
//  Main services we're going to interact with are our data store and
//  some Apple Intelligence stuff.
//
//  Services are stateless.
//
//  Created by me on 10/24/25.
//

import Foundation

protocol FPService {

}

extension FPService {

}

final class Database: FPService {

    private func persist() {

    }

    private func update() {

    }

    func sync() {

    }
}

final class Cloud: FPService {
    private func persist() {

    }

    private func update() {

    }

    func sync() {

    }
}

final class RequestGenerator: FPService {
    var template: Template?
    
    func createText() {
        
    }

}
