//
//  ContentView.swift
//  AnimalWorld
//
//  Created by zhanybek salgarin on 7/31/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var animalsViewModel: AnimalsViewModel
    
    let defaultAnimal = Animal(type: "Mammal", fileName: "Cat", name: "Cat")
    
    let colomns = [GridItem(.flexible(), spacing: 8), GridItem(.flexible(), spacing: 8), GridItem(.flexible(), spacing: 8), GridItem(.flexible(), spacing: 8)]
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ZStack {
                    Color.accentColor
                        .ignoresSafeArea()
                    ScrollView(.vertical) {
                        LazyVGrid(columns: colomns) {
                            ForEach(animalsViewModel.animals, id: \.id) { animal in
                                VStack {
                                    Image(animal.fileName)
                                        .resizable()
                                        .frame(width: geo.size.width / 4.3, height: 90)      .padding(10)
                                    Text(animal.name)
                                        .foregroundColor(Color.black)
                                }
                            }
                        }                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Animals")
                                .font(.largeTitle.bold())
                                .accessibilityAddTraits(.isHeader)
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                }
            }
        }
        .onAppear {
            animalsViewModel.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AnimalsViewModel(dataService: AnimalsDataService()))
    }
}

