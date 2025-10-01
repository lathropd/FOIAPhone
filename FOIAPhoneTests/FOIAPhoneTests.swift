//
//  FOIAPhoneTests.swift
//  FOIAPhoneTests
//
//  Created by me on 9/17/25.
//

import Testing
import Foundation
import Fakery
@testable import FOIAPhone



struct FOIAPhoneTests {
    let faker = Faker()
    
    @Test("Check slugify() results")
    func testSlugifyString() {
        for _ in 1...10 {
            let testWords = faker.lorem.words(amount: Int.random(in: 1...10))
            let testSentence = faker.lorem.sentence()
            let slugWords = fpSlugify(testWords)
            let slugSentence = fpSlugify(testSentence)
            
            //print(slugify(testSentence))
//            print(slugWords)
            #expect(slugWords.rangeOfCharacter(from: .whitespacesAndNewlines) == nil)
            #expect(slugWords.rangeOfCharacter(from: .uppercaseLetters) == nil)
            #expect(slugWords.range(of: "[\\.\\?\\!]", options:.regularExpression) == nil)

//            print(slugSentence)
            #expect(slugSentence.range(of: "[\\.\\?\\!]", options:.regularExpression) == nil)
            #expect(slugSentence.rangeOfCharacter(from: .uppercaseLetters) == nil)
            #expect(slugSentence.rangeOfCharacter(from: .whitespacesAndNewlines) == nil)

            
            
        }
        
    }
    
    
    @Test("Check generateSharingCode() results")
    func testGenerateSharingCode() {
        for _ in 1...10 {
            let code = fpGenerateSharingCode()
            #expect(code.range(of: "[\\.\\?\\!]", options:.regularExpression) == nil)
            #expect(code.rangeOfCharacter(from: .whitespacesAndNewlines) == nil)
        }
        
    }
    
    
    @Test("Check sampleData validity")
    func testSampleDataValidity() {
        
        #expect(false) // need to write this test
        
    }
    
    
    
    
    
    
    
    
}
