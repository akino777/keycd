import XCTest

@testable import keycd

final class ListAllPathsTests: BaseTestCase {
    func testListAllPaths() throws {
        let pathStorage = PathStorage(pathManagerProvider: MockPathManager())
        let result = try pathStorage.listAllPaths()

        XCTAssertEqual(
            result,
            "Name\t| Path \n------------------\nkey \t| value\n"
        )
    }
}
