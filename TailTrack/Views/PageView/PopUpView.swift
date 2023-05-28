//
//  PopUpView.swift
//  TailTrack
//
//  Created by Michelle Swastika on 26/05/23.
//

import SwiftUI

struct PopUpView: View {
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            NavigationStack {
                VStack {
                    HStack {}
                        .padding(.top)
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                NavigationLink(destination: AddReportView()) {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                        .padding(.trailing, 20)
                                }
                            }
                        }
                    
                    Text("Konfirmasi Laporan")
                        .bold()
                        .font(.title)
                        .frame(maxWidth: 200)
                        .multilineTextAlignment(.center)
                    
                    Text("Apakah Anda yakin ingin mengumpulkan laporan ini?")
                        .frame(maxWidth: 300)
                        .multilineTextAlignment(.center)
                        .padding(.top, 1)
                    
                    ButtonDestination(buttonIcon: "", buttonText: "Ya") {
                        HomeView()
                    }
                    .padding(.top, 30)
                    
                    PopUpButton(buttonIcon: "", buttonText: "Tidak"){
                        HomeView()
                    }
                    Spacer()
                    
                }
                
//                .frame(maxHeight: 400)
//                .border(Color.white, width: 2)
//                .background(.yellow)
            }
            
        }
        
//        .frame(maxHeight: 400)
//        .border(Color.white, width: 2)
//        .background(.yellow)
    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView()
    }
}
