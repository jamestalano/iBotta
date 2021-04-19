//
//  IBottaProjetUITests.swift
//  IBottaProjetUITests
//
//  Created by Mobile on 4/13/21.
//

import XCTest

class IBottaProjetUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFavotieButton() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let cellsQuery = app.collectionViews.cells
        let element = cellsQuery.otherElements.containing(.staticText, identifier:"$0.50 Cash Back").children(matching: .other).element
        element.tap()
        
        let element2 = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element2.tap()
        
        let button = element2.children(matching: .button).element
        button.tap()
        
        let backButton = app.navigationBars["IBottaProjet.DetailView"].buttons["Back"]
        backButton.tap()
        cellsQuery.otherElements.containing(.staticText, identifier:"Dove Men+Care Antiperspirant Deodorant Stick").children(matching: .other).element.tap()
        element2.tap()
        button.tap()
        backButton.tap()
        cellsQuery.otherElements.containing(.staticText, identifier:"Scotch-Brite® Scrub Dots Heavy Duty Dishwand").children(matching: .other).element.swipeUp()
        cellsQuery.otherElements.containing(.staticText, identifier:"Apple Cinnamon Toast Crunch™").children(matching: .other).element.tap()
        button.tap()
        backButton.tap()
        element.tap()
        button.tap()
        backButton.tap()
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
