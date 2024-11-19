//
//  LoadingView.swift
//  Appetizers
//
//  Created by Kamil on 14/11/2023.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        
        let activityInndicatorView = UIActivityIndicatorView(style: .large)
        activityInndicatorView.color = UIColor.brandPrimary
        activityInndicatorView.startAnimating()
        return activityInndicatorView
        
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}

struct LoadingView: View {
    var body: some View{
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            ActivityIndicator()
        }
    }
}
