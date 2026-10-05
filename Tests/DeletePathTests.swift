import XCTest

@testable import keycd

final class DeletePathTests: BaseTestCase {
    func testDeletePath_Success() throws {
        let pathStorage = PathStorage(pathManagerProvider: MockPathManager())

        try pathStorage.saveCurrentPath(key: keyForStorageTest)

        let currentPath = FileManager.default.currentDirectoryPath
        let value = try pathStorage.getPathForKey(key: keyForStorageTest)

        XCTAssertEqual(value, currentPath)

        try pathStorage.deletePath(key: keyForStorageTest)

        XCTAssertThrowsError(try pathStorage.getPathForKey(key: keyForStorageTest)) { error in
            XCTAssertEqual(error as? KeycdError, .keyNotFound(keyForStorageTest))
        }
    }

    func testDeletePath_KeyNotFound() throws {
        let pathStorage = PathStorage(pathManagerProvider: MockPathManager())

        XCTAssertThrowsError(try pathStorage.deletePath(key: keyForStorageTest)) { error in
            XCTAssertEqual(error as? KeycdError, .keyNotFound(keyForStorageTest))
        }

        let entries = try pathStorage.loadSavedPaths()

        XCTAssertEqual(entries, jsonData)
    }
}
