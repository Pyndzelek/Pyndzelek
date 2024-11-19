//
//  OrderView.swift
//  Appetizers
//
//  Created by Kamil on 13/11/2023.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack{
                    List{
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(.plain)
                    
                    Button{
                        print("ORDER")
                    } label: {
                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place order")
                    }.padding(.bottom, 10)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "cart", message: "There are no items")
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
    
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
