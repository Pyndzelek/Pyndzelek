//
//  Order.swift
//  Appetizers
//
//  Created by Kamil on 15/11/2023.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double{
        var price  = 0.0
        for item in items{
            price += item.price
        }
        return price
    }
    
    func add(_ appetizer: Appetizer){
        items.append(appetizer)
    }
    
    
    func deleteItems(at offsets: IndexSet){
        items.remove(atOffsets: offsets)
    }
}
