//
//  Header.swift
//  TailTrack
//
//  Created by Nael on 25/05/23.
//

import SwiftUI

struct Header: View {
    
    var headerTitle: String
    var headerSubTitle: String
    
    var body: some View {
        
        VStack {
            
            CircleImage(image: Image("logo tailtrack"))
                .padding(.top, 40)
            
            
            Text(headerTitle)
                .font(.title)
                .bold()
                .padding(.top, 10)
                .padding(.bottom, 10)
            
            Text(headerSubTitle)
                .font(.subheadline)
                .foregroundColor(.gray)
            
        }
        .padding(.bottom, 40)
        
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(
            headerTitle: "Header Example",
            headerSubTitle: "This is an example of header. Halah bilang aja buat header :v. Iya sih :v"
        )
        .padding(.horizontal)
    }
}
