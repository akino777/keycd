import Foundation

extension PathStorage {
    func loadSavedPaths() throws -> [String: String] {
        guard FileManager.default.fileExists(atPath: filePath) else {
            throw KeycdError.fileNotFound
        }

        let data = try Data(contentsOf: fileURL)

        do {
            return try JSONDecoder().decode([String: String].self, from: data)
        } catch is DecodingError {
            throw KeycdError.invalidFile
        }
    }
}
