//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Kamil on 14/11/2023.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromUrlString urlstring: String){
        NetworkManager.shared.downloadImage(fromURLString: urlstring){ uiImage in
            guard let uiImage = uiImage else {return}
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct remoteImage: View{
    var image: Image?
    var body: some View {
        image?.resizable() ?? Image(systemName: "fork.knife").resizable()
    }
}

struct AppetizerRemoteImage: View{
    
    @StateObject var imageLoader = ImageLoader()
    
    let urlString: String
    
    var body: some View{
        remoteImage(image: imageLoader.image)
            .onAppear{ imageLoader.load(fromUrlString: urlString)}
    }
}
