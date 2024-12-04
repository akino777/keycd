import Foundation

extension MockPathManager {
    func fileUrl() -> URL {
        let filePath = filePath()

        return URL(fileURLWithPath: filePath)
    }
}
