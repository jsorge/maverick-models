import XCTest
@testable import maverick_models

final class maverick_modelsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(maverick_models().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
