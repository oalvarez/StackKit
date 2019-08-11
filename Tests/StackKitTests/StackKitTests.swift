import XCTest
@testable import StackKit

final class StackKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(StackKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
