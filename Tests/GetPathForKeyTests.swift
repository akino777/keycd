import XCTest

@testable import keycd

final class GetPathForKeyTests: BaseTestCase {
    func testGetPathForKey() {
        let pathStorage = PathStorage(pathManagerProvider: MockPathManager())
        let result = pathStorage.getPathForKey(key: key)

        XCTAssertEqual(result, value)
    }

    func testGetPathForKey_KeyNotFound() {
        let pathStorage = PathStorage(pathManagerProvider: MockPathManager())
        let result = pathStorage.getPathForKey(key: keyForStorageTest)

        XCTAssertNil(result, "Result should be nil")
    }
}
