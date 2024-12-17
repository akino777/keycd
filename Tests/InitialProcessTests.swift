import XCTest

@testable import keycd

final class InitialProcessTests: XCTestCase {
    func testInitialProcess() {
        let mockFilePath = MockPathManager().filePath()
        let mockDirectoryPath = MockPathManager().directoryPath()
        let pathStorage = PathStorage(pathManagerProvider: MockPathManager())

        if FileManager.default.fileExists(atPath: mockFilePath) {
            do {
                try FileManager.default.removeItem(atPath: mockFilePath)
            } catch {
                XCTFail("An error occurred during cleanup: \(error)")
            }
        }

        XCTAssertNoThrow(try pathStorage.directoryChecker())
        XCTAssertNoThrow(try pathStorage.fileChecker())

        do {
            let fileData = try Data(contentsOf: URL(fileURLWithPath: mockFilePath))
            let data = Constants.defaultPathAndKey
            let jsonData = try JSONEncoder().encode(data)

            XCTAssertEqual(fileData, jsonData)
        } catch {
            XCTFail("An error occurred during fileChecker test: \(error)")
        }

        do {
            try FileManager.default.removeItem(atPath: mockDirectoryPath)
        } catch {
            XCTFail("An error occurred during cleanup: \(error)")
        }
    }
}
