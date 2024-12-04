import XCTest

class BaseTestCase: XCTestCase {
    let mockDirectoryPath = MockPathManager().directoryPath()
    let mockFilePath = MockPathManager().filePath()
    let path = TestData.path
    let jsonData = TestData.jsonData
    let key = TestData.key
    let value = TestData.value
    let keyForStorageTest = TestData.keyForStorageTest

    override func setUp() {
        super.setUp()

        do {
            let mockData = try JSONEncoder().encode(jsonData)

            try FileManager.default.createDirectory(
                atPath: mockDirectoryPath,
                withIntermediateDirectories: true, attributes: nil
            )

            FileManager.default.createFile(atPath: mockFilePath, contents: mockData, attributes: nil)
        } catch {
            XCTFail("An error occurred during setup: \(error)")
        }
    }

    override func tearDown() {
        super.tearDown()

        do {
            try FileManager.default.removeItem(atPath: mockDirectoryPath)
        } catch {
            XCTFail("An error occurred during cleanup: \(error)")
        }
    }
}
