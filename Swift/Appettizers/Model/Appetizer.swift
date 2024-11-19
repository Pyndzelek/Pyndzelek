//
//  Appetizer.swift
//  Appetizers
//
//  Created by Kamil on 13/11/2023.
//

import Foundation

struct Appetizer: Decodable, Identifiable { // używamy decodable gdy chcemy tylko pobrać dane z serweru i nic nie zmieniać, encodable gdy coś zmieniamy
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}


struct MockData {
    static let sampleAppetizer0 = Appetizer(id: 0000, name: "Test Appetizer0", description: "This is the descriprion for my appetrizer - it is good", price: 9.99, imageURL: "", calories: 99, protein: 99, carbs: 99)
    
    static let sampleAppetizer1 = Appetizer(id: 0001, name: "Test Appetizer1", description: "This is the descriprion for my appetrizer - it is good", price: 9.99, imageURL: "", calories: 99, protein: 99, carbs: 99)
    
    static let sampleAppetizer2 = Appetizer(id: 0002, name: "Test Appetizer2", description: "This is the descriprion for my appetrizer - it is good", price: 9.99, imageURL: "", calories: 99, protein: 99, carbs: 99)
    
    static let appetizers: [Appetizer] =  [sampleAppetizer0, sampleAppetizer1, sampleAppetizer2]
}


