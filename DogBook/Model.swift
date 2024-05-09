//
//  Model.swift
//  DogBook
//
//  Created by Ingrid K Chiles on 5/4/24.
//

import Foundation

// MARK: - NETWORKING MODELS

struct Breed: Codable {
    let id: Int
    let weight: Weight
    let height: Height
    let name: String
    let bred_for: String?
    let breed_group: String?
    let temperament: String?
    let reference_image_id: String
}

struct Weight: Codable {
    let imperial: String
}

struct Height: Codable {
    let imperial: String
}


struct ImageURL: Codable {
    let url: String
}

// MARK: - APP MODELS
struct Dog: Identifiable {
    let id: Int
    let weight: String
    let height: String
    let name: String
    let bredFor: String?
    let breedGroup: String?
    let temperament: String?
    let image: URL?
}
