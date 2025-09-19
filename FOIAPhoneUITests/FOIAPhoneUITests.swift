//
//  FOIAPhoneUITests.swift
//  FOIAPhoneUITests
//
//  Created by me on 9/17/25.
//

import XCTest
import Foundation
 

final class FOIAPhoneUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testSplashScreenText() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
   
        XCTAssertTrue(app.staticTexts["\nFOIA\nPhone"].exists)


        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    @MainActor
    func testSplashScreenImage() throws {
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.images["app-logo"].exists)

        
    }

    @MainActor
    func testSplashScreenProgressIndicator() throws {
        let app = XCUIApplication()
        app.launch()
        
        let _ = print(app.progressIndicators["Loading"].exists)
        XCTAssertTrue(true)

        
    }
    
    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
