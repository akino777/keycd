import Foundation

extension PathStorage {
    func deletePath(key: String) throws {
        var entries = try loadSavedPaths()

        guard entries.removeValue(forKey: key) != nil else {
            throw KeycdError.keyNotFound(key)
        }

        let updatedData = try JSONEncoder().encode(entries)

        try updatedData.write(to: fileURL)
    }
}
