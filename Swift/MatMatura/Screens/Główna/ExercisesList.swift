//
//  ExercisesList.swift
//  matmatura szkielet
//
//  Created by Kamil on 19/11/2023.
//

import SwiftUI

struct ExercisesList: View {
    
    var types: [String]
    
    var exercises: [Exercise]{
        return MockData.GetExercises(types: types)
    }
    
    var body: some View {
        
        ZStack {
            List(exercises) { exercise in
                NavigationLink(destination: ExerciseDetailView(exercise: exercise), label: {
                    ExerciseListCell(exercise: exercise)
                        .foregroundColor(.black)
                })
            }.listStyle(.plain)
                .navigationTitle("Zadania")
        }
    }
}

struct ExercisesList_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesList(types: [String](MockData.types.keys).sorted())
    }
}
