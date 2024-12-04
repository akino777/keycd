import Foundation

protocol PathManagerProvider {
    func directoryPath() -> String
    func filePath() -> String
    func fileUrl() -> URL
}
