//
//  SavedExercisesView.swift
//  matmatura szkielet
//
//  Created by Kamil on 15/11/2023.
//

import SwiftUI

struct SavedExercisesView: View {
    
    @EnvironmentObject var saved: SavedExercises
    
    var body: some View {
        NavigationView{
            VStack{
                
                    if !saved.exercises.isEmpty{
                        List(saved.exercises) { ex in
                            NavigationLink(destination: ExerciseDetailView(exercise: ex), label: {
                                ExerciseListCell(exercise: ex)
                            })
                        }.listStyle(.plain)
                    }else{
                        Text("Brak zapisanych zadań")
                    }
                
            }
            .navigationTitle("Zapisane")
        }
        
    }
}

struct SavedExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        SavedExercisesView()
    }
}
