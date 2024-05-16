//
//  DogsListView.swift
//  DogBook
//
//  Created by Ingrid K Chiles on 5/4/24.
//

import SwiftUI

struct DogsListView: View {
    
    @StateObject var vm = DogsListViewModel(service: RealDogsService())
    
    let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(vm.dogs) {
                        dog in
                        NavigationLink {
                            DogDetailView(ddvm: DogDetailViewModel(dog: dog))
                        } label: {
                            ZStack(alignment: .bottom) {
                                ZStack(alignment: .top) {
                                    Rectangle()
                                        .aspectRatio(1, contentMode: .fit)
                                        .overlay(
                                            AsyncImage(url: dog.image) { image in
                                                image.image?
                                                    .resizable()
                                                    .scaledToFill()
                                            })
                                        .clipShape(Rectangle())
                                        .padding(5)
                                    
                                    Image("polaroid-frame")
                                        .resizable()
                                        .scaledToFill()
                                }
                                
                                Text("\(dog.name)")
                                    .frame(minHeight: 40)
                                    .padding(.bottom, 10)
                                    .padding(.horizontal, 10)
                                    .font(.callout)
                                    .foregroundStyle(Color.black)
                            }
                            .padding(5)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(Color.background.edgesIgnoringSafeArea(.all))
            .navigationTitle("DogBook")
        }
        .task {
            await vm.loadData()
        }
    }
}

#Preview {
    DogsListView()
}
