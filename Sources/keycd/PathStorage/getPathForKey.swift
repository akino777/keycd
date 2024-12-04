import Foundation

extension PathStorage {
    func getPathForKey(key: String) -> String? {
        do {
            let entries = try loadSavedPaths()

            return entries?[key] ?? nil
        } catch {
            return nil
        }
    }
}
