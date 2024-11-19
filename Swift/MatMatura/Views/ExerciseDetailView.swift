//
//  ExerciseDetailView.swift
//  matmatura szkielet
//
//  Created by Kamil on 17/11/2023.
//

import SwiftUI

struct ExerciseDetailView: View {
    
    @EnvironmentObject var saved: SavedExercises
    var exercise: Exercise
    
    @State private var isShowingAnswer = false
    @State private var isShowingSolution = false
    
    var body: some View {
        
        ZStack {
            
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    Text(exercise.header)
                        .font(.title2)
                        .bold()
                    
                    Spacer()
                    
                    Button{
                        saved.HeartTapped(exercise)
                    }label: {
                        Image(systemName: saved.Contains(exercise) ? "heart.fill" : "heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40, alignment: .bottom)
                            .foregroundColor(.red)
                            .offset(y: -3)
                    }
                }.padding(.horizontal)
                
                Divider()
                
                //MARK: Exercise image
                Image(exercise.image ?? "")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 6)
                
                //MARK: Answer
                
                if isShowingAnswer {
                    if exercise.answer.count > 20 {
                        VStack{
                            Text("Poprawna odpowiedź: ")
                            Text(exercise.answer)
                                .bold()
                        }.font(.title2)
                    }
                    else{
                        HStack{
                            Text("Poprawna odpowiedź: ")
                            Text(exercise.answer)
                                .bold()
                        }.font(.title2)
                    }
                }
                
                isShowingSolution ? nil : Spacer()
                
                HStack{
                    Button{
                        withAnimation{
                            isShowingAnswer.toggle()
                        }
                    } label: {
                        MediumAppButton(title: isShowingAnswer ? "Ukryj odpowiedź" : "Zobacz odpowiedź")
                    }
                    
                    Spacer()
                    
                    Button{
                        withAnimation{
                            isShowingSolution.toggle()
                        }
                    } label: {
                        MediumAppButton(title: isShowingSolution ? "Ukryj rozwiązanine":"Zobacz rozwiązanie")
                    }
                }.padding()
                
            }.navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ExerciseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetailView(exercise: MockData.sampleExercise)
    }
}

struct MediumAppButton: View {
    
    var title: String
    
    var body: some View{
        Text(title)
            .frame(width: 160, height: 50)
            .foregroundColor(.black)
            .background(Color("AppPrimary"))
            .cornerRadius(8)
            .shadow(radius: 5)
    }
}
