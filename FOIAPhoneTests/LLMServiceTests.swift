//
//  LLMServiceTests.swift
//  FOIAPhoneTests
//
//  Created by me on 11/20/25.
//

import Testing
import SwiftAISDK
@testable import FOIAPhone

// Mock model for testing purposes
class MockLanguageModel: LanguageModelV3 {
    var specificationVersion: String = "v3"
    var provider: String = "mock-provider"
    var modelId: String = "mock-model"
    
    var cannedResponse: String
    
    init(cannedResponse: String = "Mock response") {
        self.cannedResponse = cannedResponse
    }
    
    func doGenerate(options: LanguageModelV3CallOptions) async throws -> LanguageModelV3GenerateResult {
        // Return a canned response wrapped in the expected result type
        let content = LanguageModelV3Content.text(LanguageModelV3Text(text: cannedResponse))
        let usage = LanguageModelV3Usage(inputTokens: 10, outputTokens: 10, totalTokens: 20)
        
        return LanguageModelV3GenerateResult(
            content: [content],
            finishReason: .stop,
            usage: usage
        )
    }
    
    func doStream(options: LanguageModelV3CallOptions) async throws -> LanguageModelV3StreamResult {
        // Return an empty stream for testing
        let stream = AsyncThrowingStream<LanguageModelV3StreamPart, Error> { continuation in
            continuation.finish()
        }
        return LanguageModelV3StreamResult(stream: stream)
    }
}

struct LLMServiceTests {

    @Test func testServiceCanBeInitializedWithMock() {
        let mockModel = MockLanguageModel()
        let service = LLMService(model: mockModel)
        #expect(service.model.provider == "mock-provider")
    }
    
    @Test func testPromptTemplateGeneration() {
        let mockModel = MockLanguageModel()
        let service = LLMService(model: mockModel)
        
        let data = "some records"
        let prompt = service.promptFromTemplate(data: data, template: "")
        
        #expect(prompt.contains("Write a FOIA request"))
        #expect(prompt.contains(data))
    }
    
    @Test func testGenerateTextReturnsExpectedOutput() async throws {
        let expectedOutput = "This is a mock FOIA letter."
        let mockModel = MockLanguageModel(cannedResponse: expectedOutput)
        let service = LLMService(model: mockModel)
        
        let result = try await service.generateTextFromText(prompt: "Test prompt")
        
        #expect(result == expectedOutput)
    }
    
    @Test func testGenerateResponseFromDataReturnsResult() async throws {
        let expectedOutput = "Generated FOIA Request"
        let mockModel = MockLanguageModel(cannedResponse: expectedOutput)
        let service = LLMService(model: mockModel)
        
        let result = try await service.generateResponseFromData(data: "records", template: "template")
        
        #expect(result.text == expectedOutput)
    }
}
