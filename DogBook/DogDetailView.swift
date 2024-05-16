//
//  DogDetailView.swift
//  DogBook
//
//  Created by Ingrid K Chiles on 5/4/24.
//

import SwiftUI


struct DogDetailView: View {
    @StateObject var ddvm: DogDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: .bottom) {
                    ZStack(alignment: .top) {
                        Rectangle()
                            .aspectRatio(1,contentMode: .fit)
                            .overlay(
                                AsyncImage(url: ddvm.image) { image in
                                    image.image?
                                        .resizable()
                                        .scaledToFill()
                                })
                            .clipShape(Rectangle())
                            .padding(5)
                        
                        Image("polaroid-frame-detail")
                            .resizable()
                            .scaledToFill()
                    }
                    
                    Text("\(ddvm.name)")
                        .frame(minHeight: 100)
                        .padding(.bottom, 10)
                        .padding(.horizontal, 20)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.black)
                        .multilineTextAlignment(.center)
                }
                .padding(30)
                
                VStack {
                    HStack {
                        Text("Weight: \(ddvm.weight) lbs.")
                        Text("Height: \(ddvm.height).\"")
                    }
                    
                    Divider()
                    Text("Breed Group: \(ddvm.breedGroup).")
                    Divider()
                    Text("Traits/Roles: \(ddvm.bredFor).")
                    Divider()
                    Text("Temperament: \(ddvm.temperament).")
                }
                .padding()
                .font(.title2)
                .multilineTextAlignment(.center)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .background(Color.background)
    }
}

#Preview {
    let dog = Dog(
        id: 2,
        weight: "50-60",
        height: "23 - 27",
        name: "Afghan Hound",
        bredFor: "Coursing and Hunting",
        breedGroup: "Hound",
        temperament: "Aloof, Clownish, Dignified, Independent, Happy",
        image: URL(string: "https://cdn2.thedogapi.com/images/hMyT4CDXR.jpg")
    )
    
    return DogDetailView(ddvm: DogDetailViewModel(dog: dog))
}
