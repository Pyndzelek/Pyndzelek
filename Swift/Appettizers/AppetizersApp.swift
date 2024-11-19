//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Kamil on 13/11/2023.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
        }
    }
}
