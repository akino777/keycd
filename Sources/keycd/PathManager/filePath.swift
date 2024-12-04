import Foundation

extension PathManager {
    func filePath() -> String {
        return "\(directoryPath())/saved_paths.json"
    }
}
