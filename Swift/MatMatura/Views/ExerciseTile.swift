//
//  ExerciseTile.swift
//  matmatura szkielet
//
//  Created by Kamil on 09/11/2023.
//

import SwiftUI

struct ExerciseTile: View {
    
    let exercise: Exercise
    
    var imageName: String {
        switch exercise.type{
        case "dzialania": return "plus.forwardslash.minus"
        case "trygonometria":  return "angle"
        case "funkcja": return "function"
        default: return "plus"
        }
    }
    
    var backgroundColor: Color {
        switch exercise.type{
        case "dzialania": return Color.cyan
        case "trygonometria":  return Color.gray
        case "funkcja": return Color.red
        default: return Color.yellow
        }
    }
    
    var body: some View {
        ZStack {
            HStack(spacing: 20){
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 40, height: 40)
                
                Text(exercise.title)
                    
                
                Spacer()
                    
            }
            .padding(10)
            .background(backgroundColor)
            .cornerRadius(15)
            
        }.padding(.horizontal, 10)
    }
}

struct ExerciseTile_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseTile(exercise: MockData.sampleExercise)
    }
}


