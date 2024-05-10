//  DogBookTests.swift
//  DogBookTests
//  Made with ♥︎ by Inge Chiles on 5/9/24.

import XCTest
@testable import DogBook

final class DogBookTests: XCTestCase {

    var subject: DogsListViewModel!
    
    override func setUp() {
        subject = DogsListViewModel(service: TestDogsService())
    }

    // MARK: - Test loadData()
    func testLoadDataDogAppendedToArray() async {
        await subject.loadData()
        
        XCTAssertEqual(subject.dogs, [Dog(
            id: 66,
            weight: "13",
            height: "7",
            name: "Bantha",
            bredFor: "Transport, Scouting",
            breedGroup: "Hoth Critters",
            temperament: "Beleaguered",
            image: URL(string: "imageIDString")
        )]
        )
        
    }
}
