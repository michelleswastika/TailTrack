//
//  Placeholder.swift
//  TailTrack
//
//  Created by MacBook Pro on 30/05/23.
//

import SwiftUI

struct Placeholder: View {
    
    var placeholderTitle: String
    var placeholderIcon: String
    var placeholderDescription: String
    //    var placeholderText: String
    @Binding var placeholderText: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(placeholderTitle)
                .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                .bold()
            
            HStack {
                Image(systemName: placeholderIcon)
                TextField(placeholderDescription, text: $placeholderText)
                    .keyboardType(.phonePad)
                    .autocorrectionDisabled(true)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)))
                    .foregroundColor(.black)
                
            )
        }
        .padding(.horizontal)
        
    }
}

struct Placeholder_Previews: PreviewProvider {
    @State static var binding = ""
    
    static var previews: some View {
        Placeholder(placeholderTitle: "Title",
                    placeholderIcon: "map",
                    placeholderDescription: "Description",
                    placeholderText: $binding)
    }
}

struct Plp: View {
    
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.gray)
            }
            TextField("", text: $text)
        }
    }
}

//struct Plp_Previews: PreviewProvider {
//    @State static var binding = ""
//
//    static var previews: some View {
//        Plp(placeholder: "", text: $text)
//    }
//}
