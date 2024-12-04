import Foundation

extension PathStorage {
    func listAllPaths() -> String? {
        do {
            guard let entries = try loadSavedPaths() else {
                return "echo 'Unable to open file.'"
            }

            let output = PathSorter().sortPaths(entries: entries)

            return output
        } catch {
            return nil
        }
    }
}
