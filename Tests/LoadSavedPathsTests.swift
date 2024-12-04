import XCTest

@testable import keycd

final class LoadSavedPathsTests: BaseTestCase {
    func testLoadSavedPaths_FileExists() throws {
        let pathStorage = PathStorage(pathManagerProvider: MockPathManager())
        let result = try pathStorage.loadSavedPaths()

        XCTAssertEqual(result, jsonData)
    }
}
