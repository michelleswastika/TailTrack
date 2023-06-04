//
//  AddReportView.swift
//  TailTrack
//
//  Created by Nael on 25/05/23.
//

import SwiftUI
import PhotosUI
import Firebase
import FirebaseFirestore

struct AddReportView: View {
    
    //    message error declaration
    @State private var petNameError: String = ""
    @State private var petTypeError: String = ""
    @State private var ownerPhoneError: String = ""
    @State private var showingAlert: Bool = false
    
    @State private var isTextFieldValid: Bool = true
    @State private var uploadInProgress = false
    
    //  Define Class from Other Files
    @StateObject var imagePicker = ImagePicker()
    @StateObject private var reportViewModel = ReportViewModel()
    
    //  Variables for the database
    @State private var newPetName = ""
    @State private var newPetType = ""
    @State var characteristic: String = ""
    @State private var newPetCharacteristics: [String] = []
    @State private var newPetOwner = ""
    @State private var newOwnersPhone = ""
    @State private var newLastLocation = ""
    @State private var newLastDate = Date()
    @State private var newStatus = ""
    @State private var vStackCount: Int = 1
    
    var body: some View {
        
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            NavigationStack {
                
                ScrollView {
                    
                    VStack {
                        
                        
                        //                  ========= HEADER =========
                        
                        Header(headerTitle: "Lapor Kehilangan", headerSubTitle: "Silakan isi laporan di bawah ini")
                        
                        
                        //                  ========= NAMA HEWAN =========
                        
                        Placeholder(
                            placeholderTitle: "Nama Peliharaan",
                            placeholderIcon: "mail",
                            placeholderDescription: "Nama peliharaan Anda",
                            placeholderText: $newPetName)
                        
                        
                        //                  ========= JENIS HEWAN =========
                        
                        Placeholder(
                            placeholderTitle: "Jenis Hewan",
                            placeholderIcon: "fish",
                            placeholderDescription: "Jenis peliharaan Anda beserta breed nya",
                            placeholderText: $newPetType)
                        
                        
                        //                  ========= CIRI-CIRI =========
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Ciri-Ciri:")
                                .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                                .bold()
                            
                            ForEach(0..<vStackCount, id: \.self) { index in
                                VStack {
                                    HStack {
                                        Image(systemName: "list.dash")
                                        TextField("Ciri-ciri hewan peliharaan Anda", text: Binding(
                                            get: {
                                                index < newPetCharacteristics.count ? newPetCharacteristics[index] : ""
                                            },
                                            set: { newValue in
                                                if index < newPetCharacteristics.count {
                                                    newPetCharacteristics[index] = newValue
                                                }
                                            }
                                        ))
                                        .keyboardType(.phonePad)
                                        .autocorrectionDisabled(true)
                                        
                                        if index == vStackCount - 1 {
                                            Button(action: {
                                                vStackCount += 1
                                                addCharacteristic()
                                            }) {
                                                Image(systemName: "plus.circle.fill")
                                                    .foregroundColor(.black)
                                            }
                                        }
                                    }
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)))
                                            .foregroundColor(.black)
                                    )
                                }
                            }
                        }
                        .padding(.horizontal)
                        .onAppear {
                            if newPetCharacteristics.isEmpty {
                                addCharacteristic()
                            }
                        }
                        
                        
                        //                  ========= NAMA PEMILIK =========
                        
                        Placeholder(
                            placeholderTitle: "Nama Pemilik",
                            placeholderIcon: "person",
                            placeholderDescription: "Nama Anda",
                            placeholderText: $newPetOwner)
                        
                        
                        //                  ========= NOMOR TELEPON =========
                        
                        Placeholder(
                            placeholderTitle: "Nomor Telepon",
                            placeholderIcon: "phone",
                            placeholderDescription: "Nomor telepon yang bisa dihubungi",
                            placeholderText: $newOwnersPhone)
                        
                        
                        //                  ========= LOKASI =========
                        
                        Placeholder(
                            placeholderTitle: "Lokasi Terakhir Dilihat",
                            placeholderIcon: "map",
                            placeholderDescription: "Lokasi terakhir peliharaan Anda terlihat",
                            placeholderText: $newLastLocation)
                        
                        
                        //                  ========= TANGGAL =========
                        
                        PlaceholderDate(
                            placeholderTitle: "Tanggal Terakhir Dilihat",
                            placeholderIcon: "calendar",
                            placeholderText: $newLastDate)
                        
                        
                        //                  ========= GAMBAR =========
                        
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
                        
                        
                        //                  ========= ADD BUTTON =========
                        
                        Button("Add Item") {
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
                        .padding(.top, 14)
                        .padding(.horizontal)
                        .disabled(uploadInProgress)  // Add disabled state based on uploadInProgress flag
                        .alert(isPresented: $showingAlert) {
                            Alert(
                                title: Text("Konfirmasi Laporan"),
                                message: Text("Apakah Anda yakin ingin mengajukan laporan ini?"),
                                primaryButton: .default(Text("Ya")) {
                                    Task {
                                        uploadInProgress = true  // Set uploadInProgress flag to true
                                        
                                        if imagePicker.imageSelection != nil {
                                            await imagePicker.uploadImage(imageIdentifier: imagePicker.imageIdentifier ?? "") { result in
                                                switch result {
                                                case .success:
                                                    reportViewModel.addReport(petName: newPetName, petType: newPetType, petCharacteristics: newPetCharacteristics, petOwner: newPetOwner, ownersPhone: newOwnersPhone, lastLocation: newLastLocation, lastDate: newLastDate, status: "Menunggu validasi", imageIdentifier: imagePicker.imageIdentifier ?? "")
                                                case .failure(let error):
                                                    print("Failed to upload image: \(error.localizedDescription)")
                                                }
                                                
                                                uploadInProgress = false  // Set uploadInProgress flag to false after upload is completed
                                            }
                                        } else {
                                            reportViewModel.addReport(petName: newPetName, petType: newPetType, petCharacteristics: newPetCharacteristics, petOwner: newPetOwner, ownersPhone: newOwnersPhone, lastLocation: newLastLocation, lastDate: newLastDate, status: "Menunggu validasi", imageIdentifier: imagePicker.imageIdentifier ?? "")
                                            uploadInProgress = false  // Set uploadInProgress flag to false
                                        }
                                    }
                                },
                                secondaryButton: .destructive(Text("Tidak"))
                            )
                        }

                        
                    }
                    
                }
                
                
            }
        }
        
    }
    
    private func addCharacteristic() {
        newPetCharacteristics.append("")
    }
    
}

struct AddReportView_Previews: PreviewProvider {
    static var previews: some View {
        AddReportView()
    }
}
