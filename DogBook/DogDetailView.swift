//
//  BreedDetailView.swift
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
                ZStack(alignment: .top) {
                    AsyncImage(url: ddvm.image) { image in
                        image.image?
                            .resizable()
                            .scaledToFill()
                            .frame(width: 272, height: 272)
                            .padding(.top, 15)
                            .clipShape(.rect(cornerRadius: 10))
                    }
                    
                    Image("polaroid-frame-detail")
                        .scaledToFit()
                    
                    Text("\(ddvm.name)")
                        .frame(width: 272, height: 115)
                        .padding(.top, 275)
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color.black)
                }
                
                VStack{
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
                        .font(.title)
                        .fontWeight(.light)
                        .lineLimit(nil)
                        .frame(minWidth: 20, minHeight: 20)
                }
                .padding()
                .font(.system(size: 18))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                
                Spacer()
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
