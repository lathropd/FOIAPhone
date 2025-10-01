//
//  FOIAPhoneUITests.swift
//  FOIAPhoneUITests
//
//  Created by me on 9/17/25.
//

import XCTest
import Foundation
import ViewInspector

final class FOIAPhoneUITests: XCTestCase {

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//
//        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
//
//        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

    @MainActor
    func testSplashScreenText() throws {

        let view = FPSplashContentView()
   
        let initialText = try view.inspect().find(text: "FOIA Phone")
        XCTAssertNotNil(initialText)
    }
    
    @MainActor
    func testSplashScreenImage() throws {
        let view = FPSplashContentView()
        let appLogo = try view.inspect().find(viewWithId: "FOIAPhoneAppLogo")
        XCTAssertNotNil(appLogo)
    }

    @MainActor
    func testSplashScreenProgressIndicator() throws {
        let view = FPSplashContentView()
        let progressIndicator = try view.inspect().find(viewWithAccessibilityIdentifier: "Loading")
        XCTAssertNotNil(progressIndicator)
        

        
    }
    
    
    // TODO: Figure out why testRequestsNavigationViewLoads() throws a "Set a
    //       modelContext in view's environment to use Query" warning
    @MainActor
    func testRequestsNavigationViewLoads() throws {
        let view = FPRequestsView()
            .modelContainer(FPSampleData.shared.modelContainer)

        let navigationStack = try view.inspect().find(ViewType.NavigationStack.self)
        let listView = try view.inspect().find(ViewType.List.self)
        
        XCTAssertNotNil(navigationStack)
        XCTAssertNotNil(listView)



    }
    
    @MainActor
    func testRequestDetailsViewLoads() throws {
        
        let view = FPRequestDetailView(selectedItem: FPSampleData.shared.sampleRecords.recordRequests[0])
            .modelContainer(FPSampleData.shared.modelContainer)
        
        let navigationStack = try view.inspect().find(ViewType.NavigationStack.self)
        let formView = try view.inspect().find(ViewType.Form.self)
        
        XCTAssertNotNil(navigationStack)
        XCTAssertNotNil(formView)

    }
    
    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
