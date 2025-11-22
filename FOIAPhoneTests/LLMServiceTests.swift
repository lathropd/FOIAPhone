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

    @Test func instantiateGemini() throws {
        do {
            let llm = try LLMService()
            print("\(llm)")
            
            #expect( llm.model is LanguageModelV3 )
        } catch {
            print("\(error))")
            #expect(Bool(false))
        }
    }
    
    @Test func checkGeminiUsesGoogleAI() throws {
        do {
            
            let llm = try LLMService()
            print(llm.model)
            #expect(llm.model.provider == "google.generative-ai")
        } catch {
            print("\(error)")
            #expect(Bool(false))
        }
    }
    
    @Test func testHasOutput() async throws {
        let llm = try LLMService()
        let result = try await llm.generateTextFromText(prompt: "Tell me if this prompt is working, please.")
        print("\(result)")
        #expect(result.isEmpty == false)
        
    }
    
    @Test func testCanGeneratesFOIALetter() async throws {
        let llm = try LLMService()
        let records = "all secret service documents discussing drone overflights of protected persons during the biden administration"
        let requester = "Daniel Lathrop"
        let requesterTitle = "Staff Writer"
        let requesterOrganization = "BuzzFeed News"
        let agency = "U.S. Secret Service"
        let agencyFOIAPage = "https://www.secretservice.gov/foia/request"
        let isMediaRequester = true
        let prompt = """
                    ROLE: You are an experienced FOIA requester. You are familiar with and have reviewed all of the 
                    information at the [RCFP Federal Open Government](https://www.rcfp.org/wp-content/uploads/imported/FOGG.pdf) Guide, [RCFP FOIA Wiki](https://foia.wiki/wiki/Main_Page) includeing ("FOIA BASICS")[https://foia.wiki/wiki/FOIA_Basics],  [RCFP open government guide](https://www.rcfp.org/open-government-guide/), US DOJ's [Guide to the Freedom 
                        of Information Act](https://www.justice.gov/oip/doj-guide-freedom-information-act-0).
                    
                    PROMPT: Create a request for the following records: \(records) from  \(requester), a  \
                    \(requesterTitle) at \(requesterOrganization).
                    
                    
                            
                    
                    INSTRUCTIONS: It should be addressed to the FOIA office of the \(agency) and formatted for \
                            submission based on the instructions at the agency's FOIA page: \(agencyFOIAPage).
                    
                            Please attempt to justify fee waivers and request for expedited processing based on the \
                            information aleady provided.
                            
                            Make sure the request is not overly broad, for example asking for searches using keywords \
                            likely to turn up voluminous records not related to the request at at hand.
                    
                            Make sure the request is not overly narrow, for example omitting key terms from lists of \
                            keywords being searched or being overly detailed about the search process.
                            
                            Provide justification of why potenital FOIA exemptions do not apply.
                    
                            Allow charges of up to $25 for searches and copying fees

                    
                            Also provide instructions on submitting the request.
                    
                            Make sure any directions given on the agency's FOIA page, for example directing submission \
                            to a specific website are followed.
                    
                            If possible identify the name of the FOIA officer for the \(agency) and that person's \ 
                            contact information addition to providing directions based on the agency FOIA page or pages \
                            it directly links to.
                            
                            Ensure all factual material is accurate and that your material does not include any \
                            hallucinations.
                    
                            Search court decisions such as those available at https://www.justice.gov/oip/court-decisions-overview
                            for ideas to strengthen the request but do not cite specific cases and statutes in doing so.
                            
                            
                            in addition, provide:
                                * an explanation of your reasoning and process for generating your response.
                                * a list of suggestions for changes to improve the prompt
                                * a list of suggestions for additional information to provide that would improve the
                                  prompt
                                * a list of links to material that assisted in creating the request and an explanation
                                  of what, how and why was incorporated from that material.
                    
                    
                            
                    """
        let result = try await llm.generateTextFromText(prompt: prompt)
        print(result)
        #expect(result.isEmpty == false)

        
    }

}
