import XCTest

@testable import keycd

final class SaveCurrentPathTests: BaseTestCase {
    func testSaveCurrentPath_Success() throws {
        let pathStorage = PathStorage(pathManagerProvider: MockPathManager())
        let result = pathStorage.saveCurrentPath(key: keyForStorageTest)

        XCTAssertNotNil(result, "Result should not be nil")

        let currentPath = FileManager.default.currentDirectoryPath
        let value = pathStorage.getPathForKey(key: keyForStorageTest)

        XCTAssertEqual(value, currentPath)
    }
}
