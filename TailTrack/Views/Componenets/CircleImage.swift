//
//  CircleImage.swift
//  TailTrack
//
//  Created by Nael on 25/05/23.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 100)
            .clipShape(Circle())
            .overlay(Circle().stroke(lineWidth: 0))
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("logo tailtrack"))
    }
}
