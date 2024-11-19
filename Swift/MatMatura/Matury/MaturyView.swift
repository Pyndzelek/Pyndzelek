//
//  MaturyView.swift
//  matmatura szkielet
//
//  Created by Kamil on 15/11/2023.
//

import SwiftUI

struct MaturyView: View {
    
    private var matury = ["matura maj 2023", "matura maj 2022", "matura maj 2021", "matura maj 2020", "matura maj 2019", "matura maj 2018", "matura maj 2017", "matura maj 2016", "matura maj 2015"]
    
    var body: some View {
        NavigationView{
            List(matury, id: \.self){ matura in
                Text(matura)
            }
            .navigationTitle("📄Matury")
        }
    }
}

struct MaturyView_Previews: PreviewProvider {
    static var previews: some View {
        MaturyView()
    }
}
