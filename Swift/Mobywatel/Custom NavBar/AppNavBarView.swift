//
//  AppNavBarView.swift
//  mObywatel
//
//  Created by Kamil on 19/04/2022.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
        CustomNavView{
            
            ZStack{
                
                Color.white.ignoresSafeArea()
                VStack(spacing: 30){
                    
                    CustomNavLink(destination: TextFieldView(), label:{
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 150, height: 150)
                                .foregroundColor(Color.gray)
                            Text("Dowód osobisty")
                                .foregroundColor(.black)
                            
                        }
                    })
                    CustomNavLink(destination: TextFieldView2(), label:{
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 200, height: 150)
                                .foregroundColor(Color("Szary"))
                            Text("Dowód osobisty basen")
                                .foregroundColor(.black)
                            
                        }
                    })
                }
                
                
                
                
            }
            .customNavigationBarBackButtonHidden(true)
        }
    }
}

struct AppNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavBarView()
    }
}

extension AppNavBarView{
    private var defaultNavView: some View{
        NavigationView{
            ZStack{
                Color.green.ignoresSafeArea()
                
                NavigationLink(
                    destination: Text("destination")
                        .navigationTitle("title 2")
                        
                    , label: {
                        Text("Navigate")
                    })
                
                    .navigationTitle("nav title")
            }
        }
    }
}
