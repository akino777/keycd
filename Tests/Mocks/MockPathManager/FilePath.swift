import Foundation

extension MockPathManager {
    func filePath() -> String {
        return "\(directoryPath())/saved_paths.json"
    }
}
