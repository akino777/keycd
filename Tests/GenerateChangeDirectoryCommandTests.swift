import XCTest

@testable import keycd

final class ChangeDirectoryTests: BaseTestCase {
    func testGenerateChangeDirectoryCommand() {
        let result = GenerateCommand().changeDirectory(to: path)

        XCTAssertEqual(result, "cd \(path)")
    }
}
