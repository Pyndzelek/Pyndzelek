//
//  MainView.swift
//  matmatura szkielet
//
//  Created by Kamil on 15/11/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Główna")
                }
            MaturyView()
                .tabItem{
                    Image(systemName: "pencil.and.outline")
                    Text("Matury")
                }
            SavedExercisesView()
                .tabItem{
                    Image(systemName: "bookmark")
                    Text("Zapisane")
                }
        }.tint(Color("AppPrimary"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
