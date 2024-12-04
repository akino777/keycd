import XCTest

@testable import keycd

final class DeletePathTests: BaseTestCase {
    func testDeletePath_Success() throws {
        let pathStorage = PathStorage(pathManagerProvider: MockPathManager())
        let result = pathStorage.saveCurrentPath(key: keyForStorageTest)

        XCTAssertNotNil(result, "Result should not be nil")

        let currentPath = FileManager.default.currentDirectoryPath
        let value = pathStorage.getPathForKey(key: keyForStorageTest)

        XCTAssertEqual(value, currentPath)

        let deleteResult = pathStorage.deletePath(key: keyForStorageTest)

        XCTAssertEqual(
            deleteResult,
            "echo 'The path corresponding to '\(keyForStorageTest)' was successfully deleted.'"
        )

        let deletedValue = pathStorage.getPathForKey(key: keyForStorageTest)

        XCTAssertNil(deletedValue, "Deleted value should be nil")
    }
}
