//
//  TextFieldView.swift
//  mObywatel
//
//  Created by Kamil on 20/04/2022.
//

import SwiftUI

struct TextFieldView: View {
    
    @State private var date = Date.now.formatted(date: .omitted, time: .standard)
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack {
        
            ScrollView {
                VStack{
                    
// MARK: TUTAJ JEST GŁOWNE ZDJECIE DOWODU
                    Image("dowod")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.size.width)
                    
                    //d MMM yyyy
                    HStack(spacing: 3){
                        Text(getTimeStampDateString())
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            
                        Text("(\(date))")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                           
                            
                    }
                        
// MARK: TUTAJ SA JUZ TE CZESCI DOWODU PONIZEJ DATY
                    Image("dane-1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.size.width)
                    Image("dane-2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.size.width)
                    Image("dane-3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.size.width)
                    Link(destination: URL(string: "https://www.gov.pl/web/mobywatel/gdzie-skorzystasz-z-dokumentu-mobywatel")!) {
                        Image("certyfikat")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.size.width)
                    }
                    
                    Image("koniec")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.size.width)
                    
                }.onReceive(timer, perform: { _ in
                    date = Date.now.formatted(date: .omitted, time: .standard)
                })
                
                .customNavigationTitle("Obywatel")
            }
            
        }.foregroundColor(.black)
    }
    
    func getTimeStampDateString() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "d MMM yyyy"
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
}


struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
