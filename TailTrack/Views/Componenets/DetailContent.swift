//
//  DetailContent.swift
//  TailTrack
//
//  Created by MacBook Pro on 30/05/23.
//

import SwiftUI

struct DetailContent: View {
    
    var contentTitle: String
    var contentText: String
    
    var body: some View {
        
        VStack(){
            Text(contentTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 15)
                .font(.system(size: 22))
            Text(contentText)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 18))
        }
        .padding(.leading, 30)
        
    }
}

struct DetailContent_Previews: PreviewProvider {
    static var previews: some View {
        DetailContent(contentTitle: "Contoh", contentText: "Contoh")
    }
}
