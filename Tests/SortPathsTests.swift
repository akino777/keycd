import XCTest

@testable import keycd

final class SortPathsTests: XCTestCase {
    func testSortPaths_SortedByKey() {
        let entries = ["b": "/b", "aaaaa": "/long/path"]
        let result = PathSorter().sortPaths(entries: entries)

        XCTAssertEqual(
            result,
            "Name \t| Path      \n------------------------\naaaaa\t| /long/path\nb    \t| /b        \n"
        )
    }

    func testSortPaths_Empty() {
        let result = PathSorter().sortPaths(entries: [:])

        XCTAssertEqual(
            result,
            "Name\t| Path\n-----------------\n"
        )
    }
}
