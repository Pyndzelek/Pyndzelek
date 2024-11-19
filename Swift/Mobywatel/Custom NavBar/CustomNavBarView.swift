//
//  CustonNavBarVieww.swift
//  mObywatel
//
//  Created by Kamil on 19/04/2022.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let showBackButton: Bool
    let title: String
    let subtitle: String?
    
    var body: some View {
        VStack{
            HStack{
                if showBackButton{
                    backButton
                        .frame(width: 18, height: 23)
                    
                }
                Spacer()
                
                HStack(spacing: 0){
                    
                    Image("navbar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120)
//                    Text("m")
//                        .foregroundColor(.red)
//                    Text(title)
                }.font(.title)
                
                    .foregroundColor(.black)
                
                
                
                Spacer()
                Image("menu")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 15)
                
                
            }
            
        }
        .padding([.leading, .bottom, .trailing])
        .font(.headline)
        .background(Color.white.ignoresSafeArea(edges: .top))
        .accentColor(.black)
        
    }
}

extension CustomNavBarView{
    
    private var backButton: some View{
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image("back")
                .resizable()
                .scaledToFit()
            
                
        }
    }
    
    private var titleSection: some View{
        VStack(spacing: 4){
            HStack(spacing: 0){
                Text("m")
                    .foregroundColor(.red)
                Text(title)
            }.font(.title)
                
                .foregroundColor(.black)
            if subtitle != nil{
                Text(subtitle!)
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }
        }
    }
}

struct CustonNavBarVieww_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            CustomNavBarView(showBackButton: true, title: "title", subtitle: "subtitle goes here")
            Spacer()
        }
    }
}
