//
//  LLMServiceTests.swift
//  FOIAPhoneTests
//
//  Created by me on 11/20/25.
//

import Testing
import SwiftAISDK
import GoogleProvider
@testable import FOIAPhone


struct LLMServiceTests {

    @Test func instantiateGemini() async throws {
        let llm = LLMService()

        #expect(llm.google == "Gemini is not for me.")
    }

}
