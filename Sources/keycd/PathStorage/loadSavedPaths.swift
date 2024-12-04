import Foundation

extension PathStorage {
    func loadSavedPaths() throws -> [String: String]? {
        if FileManager.default.fileExists(atPath: filePath) {
            let data = try Data(contentsOf: fileURL)
            let entries = try JSONDecoder().decode([String: String].self, from: data)

            return entries
        }

        return nil
    }
}
