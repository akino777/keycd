extension PathStorage {
    func listAllPaths() throws -> String {
        let entries = try loadSavedPaths()
        let output = PathSorter().sortPaths(entries: entries)

        return output
    }
}
