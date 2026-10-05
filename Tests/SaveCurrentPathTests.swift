import XCTest

@testable import keycd

final class SaveCurrentPathTests: BaseTestCase {
    func testSaveCurrentPath_Success() throws {
        let pathStorage = PathStorage(pathManagerProvider: MockPathManager())

        try pathStorage.saveCurrentPath(key: keyForStorageTest)

        let currentPath = FileManager.default.currentDirectoryPath
        let value = try pathStorage.getPathForKey(key: keyForStorageTest)

        XCTAssertEqual(value, currentPath)
    }

    func testSaveCurrentPath_Overwrite() throws {
        let pathStorage = PathStorage(pathManagerProvider: MockPathManager())

        try pathStorage.saveCurrentPath(key: key)

        let currentPath = FileManager.default.currentDirectoryPath
        let overwrittenValue = try pathStorage.getPathForKey(key: key)

        XCTAssertEqual(overwrittenValue, currentPath)
    }

    func testSaveCurrentPath_KeepsExistingPaths() throws {
        let pathStorage = PathStorage(pathManagerProvider: MockPathManager())

        try pathStorage.saveCurrentPath(key: keyForStorageTest)

        let existingValue = try pathStorage.getPathForKey(key: key)

        XCTAssertEqual(existingValue, value)
    }
}
