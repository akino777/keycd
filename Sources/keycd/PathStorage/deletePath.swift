import Foundation

extension PathStorage {
    func deletePath(key: String) -> String? {
        do {
            guard var entries = try loadSavedPaths() else {
                return "Unable to open file."
            }

            if entries.removeValue(forKey: key) != nil {
                let updatedData = try JSONEncoder().encode(entries)

                try updatedData.write(to: fileURL)

                return "The path corresponding to '\(key)' was successfully deleted."
            }
            return "The path corresponding to '\(key)' does not exist."
        } catch {
            return nil
        }
    }
}
