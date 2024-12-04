import Foundation

extension PathSorter {
    func sortPaths(entries: [String: String]) -> String? {
        let sortedEntries = entries.sorted { $0.key < $1.key }
        let nameWidth = max(sortedEntries.map { $0.key.count }.max() ?? 0, "Name".count)
        let pathWidth = max(sortedEntries.map { $0.value.count }.max() ?? 0, "Path".count)
        let nameHeader = "Name".padding(toLength: nameWidth, withPad: " ", startingAt: 0)
        let pathHeader = "Path".padding(toLength: pathWidth, withPad: " ", startingAt: 0)
        var output = "\(nameHeader)\t| \(pathHeader)\n"

        output += String(repeating: "-", count: nameWidth + pathWidth + 3 * 3) + "\n"

        for (name, path) in sortedEntries {
            let paddedName = name.padding(toLength: nameWidth, withPad: " ", startingAt: 0)
            let paddedPath = path.padding(toLength: pathWidth, withPad: " ", startingAt: 0)

            output += "\(paddedName)\t| \(paddedPath)\n"
        }

        return output
    }
}
