import Foundation

struct PathStorage {
    let pathManagerProvider: PathManagerProvider
    let directoryPath: String
    let fileURL: URL
    let filePath: String

    init(
        pathManagerProvider: PathManagerProvider = PathManager()
    ) {
        self.pathManagerProvider = pathManagerProvider
        directoryPath = pathManagerProvider.directoryPath()
        fileURL = pathManagerProvider.fileUrl()
        filePath = pathManagerProvider.filePath()
    }
}
