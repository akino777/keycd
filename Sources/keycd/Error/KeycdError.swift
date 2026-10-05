enum KeycdError: Error, Equatable, CustomStringConvertible {
    case keyNotFound(String)
    case fileNotFound
    case invalidFile

    var description: String {
        switch self {
        case let .keyNotFound(key):
            return "The path corresponding to '\(key)' does not exist."
        case .fileNotFound:
            return "Unable to open file."
        case .invalidFile:
            return "The saved paths file is not valid JSON."
        }
    }
}
