//
//  SelectionView.swift
//  matmatura szkielet
//
//  Created by Kamil on 15/11/2023.
//

import SwiftUI

struct SelectionView: View {
    
    @Binding var isShowing: Bool
    
    @State var chosenTypes: [String] = []
    
    let types = [String](MockData.types.keys).sorted()
    
    var body: some View {
        
        VStack{
            ForEach(types, id: \.self){ title in
                Text(title)
                    .font(.title3)
                    .frame(width: 200, height: 60)
                    .background(Color("AppPrimary"))
                    .cornerRadius(20)
                    .onTapGesture {
                        if !chosenTypes.contains(title){
                            chosenTypes.append(title)
                        }else{
                            chosenTypes.remove(at: chosenTypes.firstIndex(of: title)!)
                        }
                    }
            }
            
            Text("Wybrano: " + chosenTypes.formatted()).frame(maxWidth: .infinity)
            
            if chosenTypes.isEmpty {
                Text("Gotowe")
                    .font(.title3)
                    .frame(width: 200, height: 60)
                    .background(Color.gray)
                    .cornerRadius(20)
                    .foregroundColor(.black)
            }else{
                NavigationLink(destination: ExercisesList(types: chosenTypes), label: {
                    Text("Gotowe")
                        .font(.title3)
                        .frame(width: 200, height: 60)
                        .background(Color.green)
                        .cornerRadius(20)
                        .foregroundColor(.black)
                })
            }
        }.navigationTitle("Wybierz zadania")
        
    }
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView(isShowing: .constant(true))
    }
}
