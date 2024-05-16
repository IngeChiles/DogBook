//
//  RealDogsService.swift
//  DogBook
//
//  Created by Ingrid K Chiles on 5/4/24.
//

import Foundation

protocol DogsService {
    func getBreeds() async throws -> [Breed]
    func getImage(referenceImageId: String) async throws -> URL?
}

enum URLError: Error {
    case invalidURL
    case networkError
}

class RealDogsService: DogsService {
    private let session = URLSession.shared
    
    func getBreeds() async throws -> [Breed] {
        guard let url = URL(string: "https://api.thedogapi.com/v1/breeds") else {
            return []
        }
        
        let request = URLRequest(url: url)
        
        let (data, _) = try await session.data(for: request)
        
        let breedsResponse = try JSONDecoder().decode([Breed].self, from: data)
        
        return breedsResponse
    }
    
    func getImage(referenceImageId: String) async throws -> URL? {
        guard let imageURL = URL(string: "https://api.thedogapi.com/v1/images/\(referenceImageId)") else {
            throw URLError.invalidURL
        }
        
        let request = URLRequest(url: imageURL)
        
        let (data, _) = try await session.data(for: request)
        
        let imageURLResponse = try JSONDecoder().decode(ImageURL.self, from: data)
        
        return URL(string: imageURLResponse.url)
    }
}

