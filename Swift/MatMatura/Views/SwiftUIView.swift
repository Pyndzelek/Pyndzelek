//
//  SwiftUIView.swift
//  matmatura szkielet
//
//  Created by Kamil on 27/11/2023.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        ZStack{
            
            VStack(spacing: 10){
                Image("2023MPP06").resizable().scaledToFit()
                Divider()
                Image("2023MPP061").resizable().scaledToFit()
                
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
