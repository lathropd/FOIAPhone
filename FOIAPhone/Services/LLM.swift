//
//  LLM.swift
//  FOIAPhone
//
//  Created by me on 11/19/25.
//

import Foundation
import SwiftAISDK
import GoogleProvider

class LLMService {
    
    
    var model: LanguageModelV3
    

    
    // using: https://github.com/teunlao/swift-ai-sdk?tab=readme-ov-file#unified-provider-architecture
    //
    // looked at https://github.com/lzell/AIProxySwift
    // and OpenRouter https://openrouter.ai
    // but AIProxy.swift requires paid apple developer account to function right. :(
    //
    init() throws {
        self.model = try google("gemini-2.5-pro")
        
    }
    
    func generateTextFromText(prompt:String) async throws -> String {
        let result = try await generateText(
          model: model,
          prompt: prompt
        )
        return result.text
        
    }
    
    
    func promptFromTemplate(data: String = "", template: String) -> String {
        let prompt = """
                    Write a FOIA request for the following records, omit anything but the letter itself: \
                    \(data)"
        """
        return prompt
    }

    
    func generateResponseFromData(data: String = "", template: String) async throws ->  any GenerateTextResult  {
        let prompt = self.promptFromTemplate(data: data, template: template)
        let result = try? await generateText(
            model: model,
            prompt: prompt)
        return result!
    }
    
}



