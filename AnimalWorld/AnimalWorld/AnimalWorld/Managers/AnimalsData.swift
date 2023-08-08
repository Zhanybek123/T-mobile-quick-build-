//
//  AnimalsData.swift
//  AnimalWorld
//
//  Created by zhanybek salgarin on 8/7/23.
//

import Foundation

protocol AnimalsDataServiceProtocol {
    func fetchData() async -> [Animal]
}

struct AnimalsDataService: AnimalsDataServiceProtocol {
    
    func fetchData() async -> [Animal] {
        return [Animal(type: "mammal", fileName: "Cat", name: "Cat"),
                Animal(type: "bird", fileName: "Dog", name: "Dog"),
                Animal(type: "fish", fileName: "Bear", name: "Bear"),
                Animal(type: "fish", fileName: "Bison", name: "Bison"),
                Animal(type: "fish", fileName: "Buffalo", name: "Buffalo"),
                Animal(type: "fish", fileName: "Chicken", name: "Chicken"),
                Animal(type: "fish", fileName: "Koala", name: "Koala"),
                Animal(type: "fish", fileName: "Cow", name: "Cow"),
                Animal(type: "fish", fileName: "Crocodile", name: "Crocodile"),
                Animal(type: "fish", fileName: "Duck", name: "Duck"),
                Animal(type: "fish", fileName: "Eagle", name: "Eagle"),
                Animal(type: "fish", fileName: "Elephant", name: "Elephant"),
                Animal(type: "fish", fileName: "Fox", name: "Fox"),
                Animal(type: "fish", fileName: "Giraffe", name: "Giraffe"),
                Animal(type: "fish", fileName: "Gorilla", name: "Gorilla"),
                Animal(type: "fish", fileName: "Hedgehog", name: "Hedgehog"),
                Animal(type: "fish", fileName: "Hippo", name: "Hippo"),
                Animal(type: "fish", fileName: "Horse", name: "Horse"),
                Animal(type: "fish", fileName: "Leopard", name: "Leopard"),
                Animal(type: "fish", fileName: "Lion", name: "Lion"),
                Animal(type: "fish", fileName: "Monkey", name: "Monkey"),
                Animal(type: "fish", fileName: "Moose", name: "Moose"),
                Animal(type: "fish", fileName: "Otter", name: "Otter"),
                Animal(type: "fish", fileName: "Owl", name: "Owl"),
                Animal(type: "fish", fileName: "Panda", name: "Panda"),
                Animal(type: "fish", fileName: "Pig", name: "Pig"),
                Animal(type: "fish", fileName: "Penguin", name: "Penguin"),
                Animal(type: "fish", fileName: "Raccoon", name: "Raccoon"),
                Animal(type: "fish", fileName: "Sheep", name: "Sheep"),
                Animal(type: "fish", fileName: "Sloth", name: "Sloth"),
                Animal(type: "fish", fileName: "Snake", name: "Snake"),
                Animal(type: "fish", fileName: "Squirrel", name: "Squirrel"),
                Animal(type: "fish", fileName: "Tiger", name: "Tiger"),
                Animal(type: "fish", fileName: "Wolf", name: "Wolf"),
                Animal(type: "fish", fileName: "Zebra", name: "Zebra")]
    }
}


