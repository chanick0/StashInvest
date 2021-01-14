//
//  XCTestCase+extension.swift
//  StashInvestTests
//
//  Created by Chanick Park on 1/14/21.
//  https://stackoverflow.com/questions/31182637/delay-wait-in-a-test-case-of-xcode-ui-testing

import XCTest

extension XCTestCase {

    // waitForExpectations
    func waitFor<T>(object: T, timeout: TimeInterval = 3, file: String = #file, line: UInt = #line, expectationPredicate: @escaping (T) -> Bool) {
        let predicate = NSPredicate { obj, _ in
            expectationPredicate(obj as! T)
        }
        expectation(for: predicate, evaluatedWith: object, handler: nil)

        waitForExpectations(timeout: timeout) { error in
            if error != nil {
                let message = "Failed to fulful expectation block for \(object) after \(timeout) seconds."
                let loc = XCTSourceCodeLocation(filePath: file, lineNumber: Int(line)) // point of failure
                var issue = XCTIssue(type: .assertionFailure, compactDescription: message)
                issue.sourceCodeContext = XCTSourceCodeContext(location: loc)
                self.record(issue)
            }
        }
    }
}
