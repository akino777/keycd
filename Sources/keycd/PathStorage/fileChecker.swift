import Foundation

extension PathStorage {
    func fileChecker() throws {
        if !FileManager.default.fileExists(atPath: filePath) {
            let data = ConstantsData.defaultPathAndKey
            let jsonData = try JSONEncoder().encode(data)

            FileManager.default.createFile(atPath: filePath, contents: jsonData, attributes: nil)
        }
    }
}
