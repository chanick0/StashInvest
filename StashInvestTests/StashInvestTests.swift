//
//  StashInvestTests.swift
//  StashInvestTests
//
//  Created by Chanick Park on 1/12/21.
//

import XCTest
@testable import StashInvest

class StashInvestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testViper() {
        // Create VIPER model
        let wireframe = MockAchievementWireframe()

        guard let view = wireframe.viewController else {
            XCTFail("Error: Can't find Archievement View")
            return
        }

        guard let presenter = view.presenter as? MockAchievementPresenter else {
            XCTFail("Error: Can't find Archievement Presenter")
            return
        }

        // View load, Request networking(Load json file)
        view.viewDidLoad()

        // Wait 3 sec for object and predicate
        waitFor(object: presenter.achievements) {
            if $0.count == 3,
               view.currStatus == .done {
                return true
            }
            return true
        }
    }
}
