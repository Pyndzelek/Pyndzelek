//
//  CustomNavBarContainerView.swift
//  mObywatel
//
//  Created by Kamil on 19/04/2022.
//

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    
    let content: Content
    @State private var showBackButton: Bool = true
    @State private var title: String  =  ""
    @State private var subtitle: String? = nil
    
    init(@ViewBuilder content: ()->  Content){
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0){
            CustomNavBarView(showBackButton: showBackButton, title: title, subtitle: subtitle)
            content.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self, perform: { value in
            self.title = value
        })
        .onPreferenceChange(CustomNavBarSubtitlePreferenceKey.self, perform: { value in
            self.subtitle = value
        })
        .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKey.self, perform: { value in
            self.showBackButton = !value
        })
    }
}

struct CustomNavBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarContainerView {
            ZStack{
                Color.green.ignoresSafeArea()
                Text("Hello world")
                    .foregroundColor(.white)
                
                    .customNavigationTitle("New title")
                    .customNavigationSubtitle("subtifgdgstle")
                    .customNavigationBarBackButtonHidden(true)
            }
        }
    }
}
