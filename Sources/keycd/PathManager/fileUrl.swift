import Foundation

extension PathManager {
    func fileUrl() -> URL {
        let filePath = filePath()

        return URL(fileURLWithPath: filePath)
    }
}
