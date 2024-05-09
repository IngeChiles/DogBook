//
//  DogsListView.swift
//  DogBook
//
//  Created by Ingrid K Chiles on 5/4/24.
//

import SwiftUI

struct DogsListView: View {
    
    @StateObject var vm = DogsListViewModel()
    
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
                            VStack {
                                ZStack(alignment: .top) {
                                    AsyncImage(url: dog.image) { image in
                                        image.image?
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 160, height: 160)
                                            .padding(.top, 5)
                                            .clipShape(.rect(cornerRadius: 10))
                                    }
                                    
                                    Image("polaroid-frame")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 165)
                                    
                                    Text("\(dog.name)")
                                        .frame(width: 160, height: 50)
                                        .padding(.top, 160)
                                        .font(.system(size: 16))
                                        .foregroundStyle(Color.black)
                                }
                            }
                            .padding(.top, 10)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(Color.green.edgesIgnoringSafeArea(.all))
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
