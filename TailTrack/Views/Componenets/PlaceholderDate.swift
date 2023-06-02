//
//  PlaceholderDate.swift
//  TailTrack
//
//  Created by MacBook Pro on 02/06/23.
//

import SwiftUI

struct PlaceholderDate: View {
    var placeholderTitle: String
    var placeholderIcon: String
    //    var placeholderText: String
    @Binding var placeholderText: Date
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(placeholderTitle)
                .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                .bold()
            
            HStack {
                Image(systemName: placeholderIcon)
                ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(height: UITextField().intrinsicContentSize.height)
                            
                            DatePicker("", selection: $placeholderText, displayedComponents: .date)
                                .datePickerStyle(.compact)
                                .labelsHidden()
                                .foregroundColor(.black)
                        }
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

//struct PlaceholderDate_Previews: PreviewProvider {
//    @State private var binding: Date
//    
//    static var previews: some View {
//        PlaceholderDate(placeholderTitle: "", placeholderIcon: "calendar", placeholderDescription: "Contoh", placeholderText: $binding)
//    }
//}
