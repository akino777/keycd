import XCTest

@testable import keycd

final class GetPathForKeyTests: BaseTestCase {
    func testGetPathForKey() throws {
        let pathStorage = PathStorage(pathManagerProvider: MockPathManager())
        let result = try pathStorage.getPathForKey(key: key)

        XCTAssertEqual(result, value)
    }

    func testGetPathForKey_KeyNotFound() {
        let pathStorage = PathStorage(pathManagerProvider: MockPathManager())

        XCTAssertThrowsError(try pathStorage.getPathForKey(key: keyForStorageTest)) { error in
            XCTAssertEqual(error as? KeycdError, .keyNotFound(keyForStorageTest))
        }
    }
}
