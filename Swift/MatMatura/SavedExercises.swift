//
//  SavedExercises.swift
//  matmatura szkielet
//
//  Created by Kamil on 23/11/2023.
//

import SwiftUI

final class SavedExercises: ObservableObject {
    
    @Published var exercises: [Exercise] = []
    
    func HeartTapped(_ exercise: Exercise){
        if exercises.contains(where: { ex in
            ex.id == exercise.id
        }){
            self.RemoveAt(exercise)
        }else{
            self.Add(exercise)
        }
    }
    
    func Contains(_ exercise: Exercise) -> Bool {
        if exercises.contains(where: { ex in
            ex.id == exercise.id
        }){
            return true
        }else{
            return false
        }
    }
    
    func Add(_ exercise: Exercise){
        exercises.append(exercise)
    }
    
    
    func RemoveAt(_ exercise: Exercise){
        guard let exerciseIndex = exercises.firstIndex(where: { ex in
            ex.id == exercise.id
        }) else {
            return // tu powinien być error
        }
        exercises.remove(at: exerciseIndex)
    }
}
