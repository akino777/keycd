import Foundation

struct PathStorage {
    let directoryPath: String
    let fileURL: URL
    let filePath: String

    init(
        pathManagerProvider: PathManagerProvider = PathManager()
    ) {
        directoryPath = pathManagerProvider.directoryPath()
        fileURL = pathManagerProvider.fileUrl()
        filePath = pathManagerProvider.filePath()
    }
}
