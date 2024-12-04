import XCTest

@testable import keycd

final class ListAllPathsTests: BaseTestCase {
    func testListAllPaths() {
        let pathStorage = PathStorage(pathManagerProvider: MockPathManager())
        let result = pathStorage.listAllPaths()

        XCTAssertEqual(
            result,
            "Name\t| Path \n------------------\nkey \t| value\n"
        )
    }
}
