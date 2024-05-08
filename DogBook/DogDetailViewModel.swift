//  DogDetailViewModel.swift
//  DogBook
//  Made with ♥︎ by Inge Chiles on 5/7/24.

import Foundation
class DogDetailViewModel: ObservableObject {
    
    @Published var weight: String
    @Published var height: String
    @Published var name: String
    @Published var bredFor: String
    @Published var breedGroup: String
    @Published var temperament: String
    @Published var origin: String
    @Published var image: URL?
    
    private let dog: Dog
    
    init(dog: Dog) {
        self.dog = dog
        
        self.weight = self.dog.weight
        self.height = self.dog.height
        self.name = self.dog.name
        self.bredFor = self.dog.bredFor
        self.breedGroup = self.dog.breedGroup
        self.temperament = self.dog.temperament
        self.origin = self.dog.origin
        self.image = self.dog.image
        
    }
    
    
}
