//
//  Home.swift
//  Giphy
//
//  Created by Nikhi on 24/09/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct Home: View {
    @State var gifData: [String] = []
    @State var present = false
    @State var url = ""
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(gifData, id: \.self) { url in
                HStack {
                    Spacer(minLength: 0)
                    AnimatedImage(url: URL(string: url)!)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(CustomShape())
                }
                .padding()
            }.onChange(of: url, perform: { value in
                gifData.append(value)
            })
        }.navigationTitle("GIF's")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            Button(action: {
                self.present.toggle()
            }, label: {
                Image(systemName: "plus")
            })
        })
        .fullScreenCover(isPresented: $present, content: {
            GIFController(url: $url, present: $present)
        })
    
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
