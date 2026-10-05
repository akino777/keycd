extension PathStorage {
    func getPathForKey(key: String) throws -> String {
        let entries = try loadSavedPaths()

        guard let path = entries[key] else {
            throw KeycdError.keyNotFound(key)
        }

        return path
    }
}
