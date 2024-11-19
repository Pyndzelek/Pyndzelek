//
//  CustomNavLink.swift
//  mObywatel
//
//  Created by Kamil on 19/04/2022.
//

import SwiftUI

struct CustomNavLink<Label: View, Destination: View>: View {
    
    let destination: Destination
    let label: Label
    
    init(destination: Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        NavigationLink {
            CustomNavBarContainerView{
                destination
            }
            .navigationBarHidden(true)
        } label: {
            label
        }
        
    }
}

struct CustomNavLink_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavLink(
            destination: Text("Destination")){
                Text("Navigate")
            }
    }
}
