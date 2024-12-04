import Foundation

extension PathStorage {
    func deletePath(key: String) -> String? {
        do {
            guard var entries = try loadSavedPaths() else {
                return "echo 'Unable to open file.'"
            }

            if entries.removeValue(forKey: key) != nil {
                let updatedData = try JSONEncoder().encode(entries)

                try updatedData.write(to: fileURL)

                return "echo 'The path corresponding to '\(key)' was successfully deleted.'"
            }
            return "echo 'The path corresponding to '\(key)' does not exist.'"
        } catch {
            return nil
        }
    }
}
