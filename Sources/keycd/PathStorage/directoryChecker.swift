import Foundation

extension PathStorage {
    func directoryChecker() throws {
        if !FileManager.default.fileExists(atPath: directoryPath) {
            try FileManager.default.createDirectory(
                atPath: directoryPath, withIntermediateDirectories: true, attributes: nil
            )
        }
    }
}
