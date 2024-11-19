//
//  matmatura_szkieletApp.swift
//  matmatura szkielet
//
//  Created by Kamil on 09/11/2023.
//

import SwiftUI

@main
struct matmatura_szkieletApp: App {
    
    var savedExercises = SavedExercises()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(savedExercises)
        }
    }
}
