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
    
    @State private var isTextFieldValid: Bool = true
    
    @StateObject private var reportViewModel = ReportViewModel()
    @State private var errorMessage: String = ""
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(placeholderTitle)
                .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                .bold()
            
            HStack {
                Image(systemName: placeholderIcon)
                TextField(placeholderDescription, text: $placeholderText)
                    .if(placeholderTitle == "Nomor Telepon") { view in
                            view.keyboardType(.phonePad)
                        }
                    .autocorrectionDisabled(true)
                    .onChange(of: placeholderText){ newValue in
                        let validationResults =
                        reportViewModel.validateTextField(newValue)
                        isTextFieldValid = validationResults.isValid
                        errorMessage = validationResults.errorMessage
                    }
                    .onReceive(placeholderText.publisher.collect()) {
                        if placeholderTitle == "Nomor Telepon" {
                            let trimmedTextPhone = String($0.prefix(10))
                            if placeholderText != trimmedTextPhone{
                                placeholderText = trimmedTextPhone
                            }
                        } else if placeholderTitle == "Nama Hewan" || placeholderTitle == "Jenis Hewan" || placeholderTitle == "Nama Pelapor"{
                            let trimmedTextNameType = String($0.prefix(50))
                            if placeholderText != trimmedTextNameType{
                                placeholderText = trimmedTextNameType
                            }
                        } else if placeholderTitle == "Ciri-ciri" || placeholderTitle == "Lokasi Terakhir"{
                            let trimmedTextLocation = String($0.prefix(250))
                            if placeholderText != trimmedTextLocation{
                                placeholderText = trimmedTextLocation
                            }
                        }
                    }
                
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)))
                    .foregroundColor(.black)
                
            )
            if !isTextFieldValid {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.footnote)
                    .padding(.top, 4)
            }
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
