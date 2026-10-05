import ArgumentParser
import Foundation

struct Keycd: ParsableCommand {
    // Move directory
    @Argument(
        help: """
        Enter the name of the key that corresponds to the destination directory.
        Usage example: `kcd {name of key}`
        """
    )
    var selectKey: String?

    // Save current directory
    @Option(
        name: [.customShort("s"), .customLong("save")],
        help: """
        Saves the current directory with the specified name of the key.
        Usage example: `kcd --save {name of key}`
        """
    )
    var saveKey: String?

    // Delete directory
    @Option(
        name: [.customShort("d"), .customLong("delete")],
        help: """
        Removes the path saved with the key with the specified name.
        Usage example: `kcd --delete {name of key}`
        """
    )
    var deleteKey: String?

    // List saved directories
    @Flag(
        name: .shortAndLong,
        help: """
        Show all saved paths.
        Usage example: `kcd --list`
        """
    )
    var list: Bool = false

    func run() throws {
        try handleInitialProcess()

        if let key = selectKey {
            try handleDirectoryChange(key: key)
        }
        if let key = saveKey {
            try handleSaveCurrentPath(key: key)
        }
        if let key = deleteKey {
            try handleDeletePath(key: key)
        }
        if list {
            try handleListPaths()
        }
    }
}

Keycd.main()

extension Keycd {
    private var pathStorage: PathStorage {
        return PathStorage()
    }

    private func handleInitialProcess() throws {
        try pathStorage.directoryChecker()
        try pathStorage.fileChecker()
    }

    private func handleDirectoryChange(key: String) throws {
        let path = try pathStorage.getPathForKey(key: key)

        print(path)
    }

    private func handleSaveCurrentPath(key: String) throws {
        try pathStorage.saveCurrentPath(key: key)

        print("New path registration has been completed successfully.")
    }

    private func handleDeletePath(key: String) throws {
        try pathStorage.deletePath(key: key)

        print("The path corresponding to '\(key)' was successfully deleted.")
    }

    private func handleListPaths() throws {
        let list = try pathStorage.listAllPaths()

        print(list)
    }
}
