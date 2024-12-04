import ArgumentParser
import Foundation

struct Keycd: ParsableCommand {
    // Move directory
    @Argument(
        help: """
        Enter the name of the key that corresponds to the destination directory.
        Usage example: `qcd {name of key}`
        """
    )
    var selectKey: String?

    // Save current directory
    @Option(
        name: [.customShort("s"), .customLong("save")],
        help: """
        Saves the current directory with the specified name of the key.
        Usage example: `qcd --save {name of key}`
        """
    )
    var saveKey: String?

    // Delete directory
    @Option(
        name: [.customShort("d"), .customLong("delete")],
        help: """
        Removes the path saved with the key with the specified name.
        Usage example: `qcd --delete {name of key}`
        """
    )
    var deleteKey: String?

    // List saved directories
    @Flag(
        name: .shortAndLong,
        help: """
        Show all saved paths.
        Usage example: `qcd --list`
        """
    )
    var list: Bool = false

    mutating func run() throws {
        handleInitialProcess()

        if let key = selectKey {
            handleDirectoryChange(key: key)
        }
        if let key = saveKey {
            handleSaveCurrentPath(key: key)
        }
        if let key = deleteKey {
            handleDeletePath(key: key)
        }
        if list {
            handleListPaths()
        }
    }
}

Keycd.main()

extension Keycd {
    private var pathStorage: PathStorage {
        return PathStorage()
    }

    private func handleInitialProcess() {
        do {
            try pathStorage.directoryChecker()
            try pathStorage.fileChecker()
        } catch {
            print("echo 'An error occurred during the initialization process.'")
        }
    }

    private func handleDirectoryChange(key: String) {
        if let path = pathStorage.getPathForKey(key: key) {
            let command = GenerateCommand().changeDirectory(to: path)

            print(command)
        } else {
            print("echo 'Directory corresponding to key not found.'")
        }
    }

    private func handleSaveCurrentPath(key: String) {
        if let result = pathStorage.saveCurrentPath(key: key) {
            print(result)
        } else {
            print("echo 'An error occurred during the registration process.'")
        }
    }

    private func handleDeletePath(key: String) {
        if let result = pathStorage.deletePath(key: key) {
            print(result)
        } else {
            print("echo 'An error occurred during the deletion process.'")
        }
    }

    private func handleListPaths() {
        if let list = pathStorage.listAllPaths() {
            print(list)
        } else {
            print("echo 'An error occurred while calling the list.'")
        }
    }
}
