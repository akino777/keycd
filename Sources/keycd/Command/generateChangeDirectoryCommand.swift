import Foundation

extension GenerateCommand {
    func changeDirectory(to directory: String) -> String {
        return "cd \(directory)"
    }
}
