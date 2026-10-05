import Foundation

extension PathStorage {
    func saveCurrentPath(key: String) throws {
        let currentPath = FileManager.default.currentDirectoryPath
        let newEntry = [key: currentPath]
        var entries = try loadSavedPaths()

        entries.merge(newEntry) { _, new in new }

        let encoder = JSONEncoder()

        encoder.outputFormatting = .prettyPrinted

        let jsonData = try encoder.encode(entries)

        try jsonData.write(to: fileURL, options: .atomic)
    }
}
