//
//  ChooseImage.swift
//  TailTrack
//
//  Created by MacBook Pro on 27/05/23.
//

import SwiftUI

struct ChooseImage: View {
    var body: some View {
        
        RoundedRectangle(cornerRadius: 6)
                    .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [10]))
                    .frame(width: 155, height: 155)
                    .overlay(
                        HStack {
                            Image(systemName: "doc.badge.plus")
                            Text("Unggah Gambar ukuran 1:1")
                                .foregroundColor(.black)
                                .font(.subheadline)
                        }.padding(.horizontal, 5)
                    )
        
    }
}

struct ChooseImage_Previews: PreviewProvider {
    static var previews: some View {
        ChooseImage()
    }
}
