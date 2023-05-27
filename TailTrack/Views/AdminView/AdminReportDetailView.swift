//
//  AdminReportDetailView.swift
//  TailTrack
//
//  Created by Michelle Swastika on 26/05/23.
//

import SwiftUI

struct AdminReportDetailView: View {
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            NavigationStack {
                VStack {
                    Text("Keiko")
                        .font(.title)
                        .bold()
                    Text("Anjing Pomeranian")
                        .padding(.top, 1)
                        .padding(.bottom, 15)
                        .foregroundColor(.gray)
                    VStack(){
                        Text("Ciri-ciri :")
                            .bold()
                            .padding(.top, 15)
                            .font(.system(size: 22))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        //                        isi ciri-ciri
                        VStack(){
                            Text("- Berwarna putih")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("- Berat 10 kg")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("- Ada kalung nama berwarna hitam")
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .font(.system(size: 18))
                    }
                    .padding(.leading, 30)
                    VStack(){
                        Text("Nama pemilik :")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 15)
                            .font(.system(size: 22))
                        Text("Nael")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 18))
                    }
                    .padding(.leading, 30)
                    VStack(){
                        Text("Nomor telepon pemilik :")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 15)
                            .font(.system(size: 22))
                        Text("08123456789")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 18))
                    }
                    .padding(.leading, 30)
                    VStack(){
                        Text("Lokasi terakhir terlihat :")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 15)
                            .font(.system(size: 22))
                        Text("Perumahan Waterfront Citraland WP 50")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 18))
                    }
                    .padding(.leading, 30)
                    VStack(){
                        Text("Tanggal terakhir terlihat :")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 15)
                            .font(.system(size: 22))
                        Text("14/05/2023")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 18))
                    }
                    .padding(.leading, 30)
                }
                
                ButtonDestination(buttonIcon: "xmark", buttonText: "Tolak") {
                    HomeView(reportLists: [Report]())
                }
                .padding(.top, 70)
                
                ValidationButton(buttonIcon: "checkmark", buttonText: "Valid") {
                    HomeView(reportLists: [Report]())
                }

                Spacer()
            }
        }
    }
}

struct AdminReportDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AdminReportDetailView()
    }
}
