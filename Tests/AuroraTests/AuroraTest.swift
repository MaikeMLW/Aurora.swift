// $$HEADER$$

import XCTest

@testable import Aurora

class AuroraTest: XCTestCase {
    func testRegexTrue() {
        let regexMatch = "qqqqlOldddd" =~ "l(o|O)l"
        XCTAssert(regexMatch == true)
    }

    func testRegexFalse() {
        let regexMatch = "qqqqlxldddd" =~ "l(o|O)l"
        XCTAssert(regexMatch != true)
    }
}
