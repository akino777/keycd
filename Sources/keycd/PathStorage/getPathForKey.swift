extension PathStorage {
    func getPathForKey(key: String) -> String? {
        do {
            let entries = try loadSavedPaths()

            return entries?[key]
        } catch {
            return nil
        }
    }
}
