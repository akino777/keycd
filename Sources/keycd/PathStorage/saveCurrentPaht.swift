// Save Current path
import Foundation

extension PathStorage {
    func saveCurrentPath(key: String) -> String? {
        let currentPath = FileManager.default.currentDirectoryPath
        let newEntry = [key: currentPath]

        do {
            guard var entries = try loadSavedPaths() else {
                return "echo 'Unable to open file.'"
            }

            entries.merge(newEntry) { _, new in new }

            let encoder = JSONEncoder()

            encoder.outputFormatting = .prettyPrinted

            let jsonData = try encoder.encode(entries)

            try jsonData.write(to: fileURL, options: .atomic)

            return "echo 'New path registration has been completed successfully.'"
        } catch {
            return nil
        }
    }
}
