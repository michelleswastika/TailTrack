//
//  Testing2View.swift
//  TailTrack
//
//  Created by NAEL SM MIMI YG LAGI STRES on 29/05/23.
//

//  INI CMN DUMMY CODEE!!

import SwiftUI
import Firebase

//struct Testing2View: View {
//    @StateObject private var viewModel = ItemViewModel()
//    
//    var body: some View {
//        List(viewModel.items) { item in
//            VStack(alignment: .leading) {
//                Text(item.petName)
//                    .font(.headline)
//                ForEach(item.petCharacteristics, id: \.self) { petCharacteristic in
//                    Text(petCharacteristic)
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//                }
//                Text(formattedDate(item.lastDate))
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//            }
//        }
//        .onAppear {
//            viewModel.fetchItems()
//        }
//    }
//}
//
//func formattedDate(_ date: Date) -> String {
//    let formatter = DateFormatter()
//    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//    return formatter.string(from: date)
//}
//
//struct Testing2View_Previews: PreviewProvider {
//    static var previews: some View {
//        Testing2View()
//    }
//}
