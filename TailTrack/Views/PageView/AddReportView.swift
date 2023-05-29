//
//  AddReportView.swift
//  TailTrack
//
//  Created by Nael on 25/05/23.
//

import SwiftUI
import PhotosUI

struct AddReportView: View {
<<<<<<< Updated upstream
=======
    //    message error declaration
    @State private var petNameError: String = ""
    @State private var petTypeError: String = ""
    @State private var ownerPhoneError: String = ""
    @State private var showingAlert: Bool = false
    
    @State private var isTextFieldValid: Bool = true
    
    //    @State private var newReport = Report.emptyReport
    @StateObject var imagePicker = ImagePicker()
    @StateObject private var reportViewModel = ReportViewModel()
    
    @State var characteristic: String = ""
>>>>>>> Stashed changes
    
    @State private var email: String = ""
    @StateObject var imagePicker = ImagePicker()
    
    //    @StateObject private var reportViewModel = ReportViewModel()
    @State private var newPetName = ""
    @State private var newPetType = ""
    @State private var newPetCharacteristics = ""
    @State private var newPetOwner = ""
    @State private var newOwnersPhone = ""
    @State private var newLastLocation = ""
    @State private var newLastDate = ""
    @State private var newStatus = ""
    
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
<<<<<<< Updated upstream
                                TextField("Nama peliharaan Anda", text: $email)    // Ambil dari State di atas
=======
                                TextField("Nama peliharaan Anda", text: $newPetName)
                                    .keyboardType(.asciiCapable)
                                    .autocorrectionDisabled(true)
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                                TextField("Jenis peliharaan Anda beserta breed nya", text: $email)    // Ambil dari State di atas
=======
                                TextField("Jenis peliharaan Anda beserta breed nya", text: $newPetType)
                                    .keyboardType(.asciiCapable)
                                    .autocorrectionDisabled(true)
>>>>>>> Stashed changes
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)))
                                    .foregroundColor(.black)
                                
                            )
                        }
                        .padding(.horizontal)
                        
<<<<<<< Updated upstream
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
=======
                        
                        //                        VStack(alignment: .leading) {
                        //                            Text("Ciri-Ciri")
                        //                                .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                        //                                .bold()
                        //                            HStack {
                        //                                Image(systemName: "list.dash")
                        //                                ForEach(0..<Int(3) ?? 0, id: \.self) { index in
                        //                                    TextField("Ciri-ciri hewan peliharaan Anda", text: $newPetCharacteristics[index])
                        //                                }
                        //
                        //                                Button(action: {
                        //
                        //                                }) {
                        //                                    Image(systemName: "plus.circle.fill")
                        //                                }
                        //                                .tint(.black)
                        //                            }
                        //                            .padding()
                        //                            .background(
                        //                                RoundedRectangle(cornerRadius: 10)
                        //                                    .fill(Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)))
                        //                                    .foregroundColor(.black)
                        //                            )
                        
                        
                        //                            ForEach(newReport.petCharacteristics.indices, id: \.self) { index in
                        //                                HStack {
                        //                                    Image(systemName: "list.dash")
                        //                                    TextField("Ciri-ciri hewan peliharaan Anda", text: $newReport.petCharacteristics[index])
                        //                                    Button(action:{
                        //                                        newReport.petCharacteristics.append(characteristic)
                        //                                    }){
                        //                                        Image(systemName: "plus.circle.fill")
                        //                                    }
                        //                                    .tint(.black)
                        //                                }
                        //                                .padding()
                        //                                .background(
                        //                                    RoundedRectangle(cornerRadius: 10)
                        //                                        .fill(Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)))
                        //                                        .foregroundColor(.black)
                        //                                )
                        //                            }
                        //                        }
                        //                        .padding(.horizontal)
>>>>>>> Stashed changes
                        
                        VStack(alignment: .leading) {
                            Text("Nama Pemilik")
                                .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                                .bold()
                            
                            HStack {
                                Image(systemName: "person")
<<<<<<< Updated upstream
                                TextField("Nama Anda", text: $email)    // Ambil dari State di atas
=======
                                TextField("Nama Anda", text: $newPetOwner)
                                    .keyboardType(.asciiCapable)
                                    .autocorrectionDisabled(true)
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                                TextField("Nomor telepon yang bisa dihubungi", text: $email)    // Ambil dari State di atas
=======
                                TextField("Nomor telepon yang bisa dihubungi", text: $newOwnersPhone)
                                    .keyboardType(.phonePad)
                                    .autocorrectionDisabled(true)
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                                TextField("Lokasi terakhir peliharaan Anda terlihat", text: $email)    // Ambil dari State di atas
=======
                                TextField("Lokasi terakhir peliharaan Anda terlihat", text: $newLastLocation)
                                    .keyboardType(.asciiCapable)
                                    .autocorrectionDisabled(true)
>>>>>>> Stashed changes
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)))
                                    .foregroundColor(.black)
                                
                            )
                        }
                        .padding(.horizontal)
                        
<<<<<<< Updated upstream
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
=======
                        //                        VStack(alignment: .leading) {
                        //                            Text("Tanggal Terakhir Dilihat")
                        //                                .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                        //                                .bold()
                        //
                        //                            HStack {
                        //                                Image(systemName: "calendar")
                        //                                DatePicker("DD/MM/YYYY", selection: $newLastDate,
                        //                                           in: ...Date(), displayedComponents: .date)    // Exclude the time component
                        //
                        //                            }
                        //                            .padding()
                        //                            .background(
                        //                                RoundedRectangle(cornerRadius: 10)
                        //                                    .fill(Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)))
                        //                                    .foregroundColor(.black)
                        //
                        //                            )
                        //                        }
                        //                        .padding(.horizontal)
>>>>>>> Stashed changes
                        
                        //                        VStack {
                        //
                        //                            if let image = imagePicker.image {
                        //                                PhotosPicker(selection: $imagePicker.imageSelection,
                        //                                             matching: .images,
                        //                                             photoLibrary: .shared()) {
                        //                                    image
                        //                                        .resizable()
                        //                                        .scaledToFit()
                        //                                        .overlay(
                        //                                            Rectangle()
                        //                                                .opacity(0.7)
                        //                                                .foregroundColor(.gray)
                        //                                                .overlay(
                        //                                                    HStack {
                        //                                                        Image(systemName: "pencil")
                        //                                                            .resizable()
                        //                                                            .frame(width: 20, height: 20)
                        //                                                            .foregroundColor(.white)
                        //                                                            .bold()
                        //                                                        Text("Edit Gambar")
                        //                                                            .foregroundColor(.white)
                        //                                                            .bold()
                        //                                                    }
                        //                                                )
                        //                                        )
                        //                                }
                        //                            } else {
                        //                                Text("Unggah Foto Hewan")
                        //                                    .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                        //                                    .bold()
                        //                                PhotosPicker(selection: $imagePicker.imageSelection,
                        //                                             matching: .images,
                        //                                             photoLibrary: .shared()) {
                        //                                    ChooseImage()
                        //                                }
                        //                                             .foregroundColor(.gray)
                        //                            }
                        //
                        //                        }
                        //                        .padding()
                        
<<<<<<< Updated upstream
                        ButtonDestination(buttonIcon: "arrow.up.doc.fill", buttonText: "Ajukan Laporan") {
                            HomeView()
                        }
                        
                    }
=======
                        //                        ButtonDestination(buttonIcon: "arrow.up.doc.fill", buttonText: "Ajukan Laporan") {
                        //                            HomeView()
                        //                        }
                        
                        //                        ButtonDestination(buttonIcon: "newspaper.fill", buttonText: "Ajukan Laporan") {
                        //                            HomeView()
                        //                        }
                        
                        Button("Add Item") {
//                            reportViewModel.addReport(petName: newPetName, petType: newPetType, petOwner: newPetOwner, ownersPhone: newOwnersPhone, lastLocation: newLastLocation)
                            showingAlert = true
                        }
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                        )
                        .padding(.horizontal)
                        .alert(isPresented: $showingAlert){
                            Alert(title: Text("Konfirmasi Laporan"),
                                  message: Text("Apakah Anda yakin ingin mengajukan laporan ini?"),
                                  primaryButton: .default(Text("Ya"),action: {
                                reportViewModel.addReport(petName: newPetName, petType: newPetType, petOwner: newPetOwner, ownersPhone: newOwnersPhone, lastLocation: newLastLocation)}), secondaryButton: .destructive(Text("Tidak")))
                        }
                        
                        //                            isShowingPopup.toggle() // Set isShowingPopup to true to present the popup
                        
                    }
                    
                    //                        .onAppear {
                    //                            print("ButtonDestination view appeared") // Debug print statement
                    //
                    //                            reportViewModel.addReport(petName: newReport.petName, petType: newReport.petType, petCharacteristics: newReport.petCharacteristics, petOwner: newReport.petOwner, ownersPhone: newReport.ownersPhone, lastLocation: newReport.lastLocation, lastDate: newReport.lastDate, status: "menunggu validasi", petPhoto: "s")
                    //
                    //                            print(reportViewModel.reports) // Debug print statement
                    //
                    //                        }
                    
                    //                        .sheet(isPresented: $isShowingPopup) {
                    //                            PopUpView()
                    //                                .navigationBarHidden(true)
                    //                        }
                    
                    
                    //                        ButtonDestination(action: {
                    //                            isShowingPopup = true
                    //                        }) {
                    //                            HStack {
                    //                                Image(systemName: "newspaper.fill")
                    //                                Text("Ajukan Laporan")
                    //                            }
                    //                        }
                    //                        .background(NavigationLink(destination: PopUpView(), isActive: $isShowingPopup) {  })
                    //                        .onAppear {
                    //                            print("ButtonDestination view appeared") // Debug print statement
                    //                            reportViewModel.addReport(petName: newReport.petName, petType: newReport.petType, petCharacteristics: newReport.petCharacteristics, petOwner: newReport.petOwner, ownersPhone: newReport.ownersPhone, lastLocation: newReport.lastLocation, lastDate: newReport.lastDate, status: "menunggu validasi", petPhoto: "s")
                    //                            print(reportViewModel.reports) // Debug print statement
                    //                        }
                    
>>>>>>> Stashed changes
                }
                
                
            }
        }
        
    }
}

<<<<<<< Updated upstream
=======


>>>>>>> Stashed changes
struct AddReportView_Previews: PreviewProvider {
    static var previews: some View {
        AddReportView()
    }
}
