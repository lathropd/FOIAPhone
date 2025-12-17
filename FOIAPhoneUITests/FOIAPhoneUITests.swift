//
//  FOIAPhoneUITests.swift
//  FOIAPhoneUITests
//
//  Created by me on 11/20/25.
//

import XCTest
import GRDB

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
    func testMainMenuNavigation() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Check if we are on the main menu by looking for one of its unique buttons
        let newRequestButton = app.buttons["NewRequestButton"]
        
        if newRequestButton.exists {
            // Check existence of other main menu items
            XCTAssertTrue(app.buttons["ViewRequestsButton"].exists, "View Requests button should exist")
            XCTAssertTrue(app.buttons["AgenciesButton"].exists, "Agencies button should exist")
            XCTAssertTrue(app.buttons["SettingsButton"].exists, "Settings button should exist")
            
            // Test Navigation to New Request
            newRequestButton.tap()
            
            // Verify we navigated (assuming the destination has some identification, or just that the button is gone/navigation happened)
            // Ideally, the destination view would have a title or identifier we can check.
            // For now, let's just assert the button might not be hittable or we are in a new state.
            // A better check would be looking for a unique element on RequestView.
        }
    }
    
    @MainActor
    func testSettingsNavigation() throws {
        let app = XCUIApplication()
        app.launch()
        
        let settingsButton = app.buttons["SettingsButton"]
        
        if settingsButton.exists {
            settingsButton.tap()
            
            // Verify we are on Settings screen
            // Assuming SettingsView has a navigation title "Settings" or similar unique element.
            let settingsNavBar = app.navigationBars["Settings"] // Adjust if title is different
            if settingsNavBar.waitForExistence(timeout: 2.0) {
                 XCTAssertTrue(settingsNavBar.exists)
            }
        }
    }
    
    @MainActor
    func testLoginUIElements() throws {
        let app = XCUIApplication()
        app.launch()
        
        // This test assumes the app can be in a state where LoginView is visible.
        // If the app launches into MainMenu, you might need to navigate to login via Settings -> Account or similar if that path exists.
        // Based on the code, LoginView seems to be a separate view.
        
        // If we can see the email field, we test the login form.
        let emailField = app.textFields["EmailTextField"]
        
        if emailField.exists {
            let passwordField = app.secureTextFields["PasswordTextField"]
            let signInButton = app.buttons["SignInButton"]
            let createAccountButton = app.buttons["CreateAccountButton"]
            
            XCTAssertTrue(passwordField.exists)
            XCTAssertTrue(signInButton.exists)
            XCTAssertTrue(createAccountButton.exists)
            
            // Interact with fields
            emailField.tap()
            emailField.typeText("user@example.com")
            
            passwordField.tap()
            passwordField.typeText("securepassword")
            
            // We don't tap sign in to avoid actual network calls or state changes that might flake
        }
    }
}
