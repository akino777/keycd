import XCTest

@testable import keycd

final class LoadSavedPathsTests: BaseTestCase {
    func testLoadSavedPaths_FileExists() throws {
        let pathStorage = PathStorage(pathManagerProvider: MockPathManager())
        let result = try pathStorage.loadSavedPaths()

        XCTAssertEqual(result, jsonData)
    }

    func testLoadSavedPaths_FileNotExists() throws {
        try FileManager.default.removeItem(atPath: mockFilePath)

        let pathStorage = PathStorage(pathManagerProvider: MockPathManager())

        XCTAssertThrowsError(try pathStorage.loadSavedPaths()) { error in
            XCTAssertEqual(error as? KeycdError, .fileNotFound)
        }
    }

    func testLoadSavedPaths_InvalidJson() throws {
        try Data("invalid json".utf8).write(to: URL(fileURLWithPath: mockFilePath))

        let pathStorage = PathStorage(pathManagerProvider: MockPathManager())

        XCTAssertThrowsError(try pathStorage.loadSavedPaths()) { error in
            XCTAssertEqual(error as? KeycdError, .invalidFile)
        }
    }
}
