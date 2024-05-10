//  TestDogsService.swift
//  DogBook
//  Made with ♥︎ by Inge Chiles on 5/9/24.

import Foundation
@testable import DogBook

final class TestDogsService: DogsService {
    
    var breeds = [Breed(
        id: 66,
        weight: Weight(imperial: "13"),
        height: Height(imperial: "7"),
        name: "Bantha",
        bred_for: "Transport, Scouting",
        breed_group: "Hoth Critters",
        temperament: "Beleaguered",
        reference_image_id: "imageIDString"
    )]
    
    func getBreeds() async throws -> [DogBook.Breed] {
        return breeds
    }
    
    func getImage(referenceImageId: String) async throws -> URL? {
        return URL(string: referenceImageId)
    }
}
