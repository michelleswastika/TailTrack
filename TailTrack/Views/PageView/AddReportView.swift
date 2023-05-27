//
//  AddReportView.swift
//  TailTrack
//
//  Created by Nael on 25/05/23.
//

import SwiftUI
import PhotosUI

struct AddReportView: View {
    
    @State private var email: String = ""
    @StateObject var imagePicker = ImagePicker()
    
    var body: some View {
        
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            NavigationView {
                
                ScrollView {
                    
                    VStack {
                        
                        
                        //                  ========= HEADER =========
                        
                        Header(headerTitle: "Lapor Kehilangan", headerSubTitle: "Silakan isi laporan di bawah ini")
                        
                        VStack(alignment: .leading) {
                            Text("Nama Peliharaan")
                                .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                                .bold()
                            
                            HStack {
                                Image(systemName: "mail")
                                TextField("Nama peliharaan Anda", text: $email)    // Ambil dari State di atas
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)))
                                    .foregroundColor(.black)
                                
                            )
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading) {
                            Text("Jenis Hewan")
                                .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                                .bold()
                            
                            HStack {
                                Image(systemName: "fish")
                                TextField("Jenis peliharaan Anda beserta breed nya", text: $email)    // Ambil dari State di atas
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)))
                                    .foregroundColor(.black)
                                
                            )
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading) {
                            Text("Ciri-Ciri")
                                .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                                .bold()
                            
                            HStack {
                                Image(systemName: "list.dash")
                                TextField("Kapan terakhir kali peliharaan Anda terlihat", text: $email)    // Ambil dari State di atas
                                Image(systemName: "plus.circle.fill")
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)))
                                    .foregroundColor(.black)
                                
                            )
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading) {
                            Text("Nama Pemilik")
                                .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                                .bold()
                            
                            HStack {
                                Image(systemName: "person")
                                TextField("Nama Anda", text: $email)    // Ambil dari State di atas
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)))
                                    .foregroundColor(.black)
                                
                            )
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading) {
                            Text("Nomor Telepon")
                                .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                                .bold()
                            
                            HStack {
                                Image(systemName: "phone")
                                TextField("Nomor telepon yang bisa dihubungi", text: $email)    // Ambil dari State di atas
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)))
                                    .foregroundColor(.black)
                                
                            )
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading) {
                            Text("Lokasi Terakhir Dilihat")
                                .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                                .bold()
                            
                            HStack {
                                Image(systemName: "map")
                                TextField("Lokasi terakhir peliharaan Anda terlihat", text: $email)    // Ambil dari State di atas
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)))
                                    .foregroundColor(.black)
                                
                            )
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading) {
                            Text("Tanggal Terakhir Dilihat")
                                .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                                .bold()
                            
                            HStack {
                                Image(systemName: "calendar")
                                TextField("Kapan terakhir kali peliharaan Anda terlihat", text: $email)    // Ambil dari State di atas
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)))
                                    .foregroundColor(.black)
                                
                            )
                        }
                        .padding(.horizontal)
                        
                        VStack {
                            
                            if let image = imagePicker.image {
                                PhotosPicker(selection: $imagePicker.imageSelection,
                                             matching: .images,
                                             photoLibrary: .shared()) {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .overlay(
                                            Rectangle()
                                                .opacity(0.7)
                                                .foregroundColor(.gray)
                                                .overlay(
                                                    HStack {
                                                        Image(systemName: "pencil")
                                                            .resizable()
                                                            .frame(width: 20, height: 20)
                                                            .foregroundColor(.white)
                                                            .bold()
                                                        Text("Edit Gambar")
                                                            .foregroundColor(.white)
                                                            .bold()
                                                    }
                                                )
                                        )
                                }
                            } else {
                                Text("Unggah Foto Hewan")
                                    .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                                    .bold()
                                PhotosPicker(selection: $imagePicker.imageSelection,
                                             matching: .images,
                                             photoLibrary: .shared()) {
                                    ChooseImage()
                                }
                                             .foregroundColor(.gray)
                            }
                            
                        }
                        .padding()
                        
                        ButtonDestination(buttonIcon: "arrow.up.doc.fill", buttonText: "Ajukan Laporan") {
                            HomeView()
                        }
                        
                    }
                }
            }
        }
        
    }
}

struct AddReportView_Previews: PreviewProvider {
    static var previews: some View {
        AddReportView()
    }
}
