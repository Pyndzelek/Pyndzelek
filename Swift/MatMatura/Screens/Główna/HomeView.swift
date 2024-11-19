//
//  ContentView.swift
//  matmatura szkielet
//
//  Created by Kamil on 09/11/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isShowingSelectionView = false
    @State private var isShowingExerciseDetailView = false
    @State var chosenTypes = [String]()
    let randomExercises: [Exercise] = MockData.getRandomExercises(count: 3)
    
    @State var searchText: String = ""
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack {
                        //Nagłówek
                        Text("Wybieraj z pośród setek zadań maturalnych")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .fontWeight(.light)
                            .padding(.horizontal)
                            .offset(y: -10)
                        
                        TextField("Znajdź zadanie", text: $searchText)
                            .padding(10)
                            .background(LinearGradient(gradient: Gradient(colors: [Color("AppPrimary"),Color("AppPrimary"), .white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(8)
                            .shadow(color: .gray, radius: 10)
                            .padding([.horizontal, .bottom])
                        
                        //MARK: sekcja z kategoriami
                        ZStack {
                            VStack {
                                HStack {
                                    Text("Posegregowane zadania")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    
                                    Spacer()
                                    
                                    NavigationLink(destination: SelectionView(isShowing: $isShowingSelectionView), label: {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 8)
                                                .opacity(0.2)
                                                .frame(width: 120, height: 20)
                                            HStack(spacing: 3){
                                                Text("Zobacz więcej")
                                                    .font(.caption)
                                                
                                                Image(systemName: "control")
                                                    .rotationEffect(Angle(degrees: 90))
                                            }
                                        }.foregroundColor(Color("AppPrimary"))
                                    })
                                }.padding(.horizontal)
                                
                                LazyVGrid(columns: columns){
                                    GridListTile(title: "Liczby i działania")
                                    GridListTile(title: "Funckcja liniowa")
                                    GridListTile(title: "Wielomiany")
                                    GridListTile(title: "Trygonometria")
                                    GridListTile(title: "Logarytmy")
                                    GridListTile(title: "Ciągi")
                                }
                            }
                        }
                        
                        //MARK: Sekcja z losowymi zadaniami
                        Text("Losowe zadania")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .bold()
                            .font(.title2)
                            .padding(.horizontal)
                        
                        ForEach(randomExercises) { exercise in
                            NavigationLink(destination: ExerciseDetailView(exercise: exercise), label: {
                                RandomExerciseListTile(exercise: exercise)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                            })
                        }
                        
                    }
                }.scrollDisabled(isShowingSelectionView)
                    .blur(radius: isShowingSelectionView ? 20 : 0)
            }
            
            .navigationTitle("Odkrywaj")
            
        }
        .tint(Color("AppPrimary"))
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}







struct GridListTile: View {
    //potrzebne do odróżnienia dark mode
    @Environment(\.colorScheme) var colorScheme
    
    let title: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color(.systemBackground))
                .shadow(color: colorScheme == .dark ? .white : .gray, radius: 5)
            
            Text(title)
                .font(.subheadline)
            
        }.frame(width: 150, height: 50)
            .padding(.bottom, 15)
    }
}

struct RandomExerciseListTile: View{
    
    let exercise: Exercise
    
    var body: some View{
        VStack(alignment: .leading){
            Text(exercise.header)
                .fontWeight(.semibold)
            Text(exercise.descriprion)
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding(10)
            .background(Color("AppPrimary"))
            .cornerRadius(10)
            .padding(.horizontal)
    }
}
