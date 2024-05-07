//
//  ContentView.swift
//  DogBook
//
//  Created by Ingrid K Chiles on 5/4/24.
//

import SwiftUI

struct ContentView: View {

    @StateObject var vm = DogsViewModel()

    let columns = Array(repeating: GridItem(.flexible()), count: 3)

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(vm.dogs) {
                        dog in
                        NavigationLink {
                            BreedDetailView()
                        } label: {
                            VStack {
                                AsyncImage(url: dog.image) { image in
                                    image.image?
                                        .resizable()
                                        .scaledToFit()
                                }
                                .frame(width: 100, height: 100)
                                .background(.black)
                                .clipShape(.rect(cornerRadius: 25))

                                    Text(dog.name)
                                    .font(.title2)

                                Spacer()
                            }
                        }
                    }
                }
            }
        }
        .task {
            await vm.loadData()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
