//
//  DogsListViewModel.swift
//  DogBook
//
//  Created by Ingrid K Chiles on 5/4/24.
//

import Foundation

class DogsListViewModel: ObservableObject {
    
    private let service: DogsService
    
    @Published var dogs: [Dog] = []
    
    init(service: DogsService) {
        self.service = service
    }
    
    func loadData() async {
        do {
            let breeds = try await service.getBreeds()
            print(breeds)
            
            for breed in breeds {
                let imageURL = try await service.getImage(referenceImageId: breed.reference_image_id)
                let dog = Dog(id: breed.id,
                              weight: breed.weight.imperial,
                              height: breed.height.imperial,
                              name: breed.name,
                              bredFor: breed.bred_for,
                              breedGroup: breed.breed_group,
                              temperament: breed.temperament,
                              image: imageURL)
                
                dogs.append(dog)
                
            }
        } catch {
            print(error)
        }
    }
}
