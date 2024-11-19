//
//  SelectionView2.swift
//  matmatura szkielet
//
//  Created by Kamil on 19/11/2023.
//

import SwiftUI

struct ExerciseListCell: View {
    
    var exercise: Exercise
    
    var body: some View {
        VStack(spacing: 3){
            Text(exercise.header)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title2)
                .bold()
            Image(exercise.image ?? "")
                .resizable()
                .scaledToFit()
        }
    }
}

struct ExerciseListCell_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseListCell(exercise: MockData.sampleExercise)
    }
}
