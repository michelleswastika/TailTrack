//
//  AddReportView.swift
//  TailTrack
//
//  Created by Nael on 25/05/23.
//

import SwiftUI
import PhotosUI

struct AddReportView: View {
    //    message error declaration
<<<<<<< Updated upstream
    @State private var petNameError: String = ""
    @State private var petTypeError: String = ""
    @State private var ownerPhoneError: String = ""
    
    @State private var isTextFieldValid: Bool = true
=======
    @State private var showingAlert: Bool = false
    
    @State private var uploadInProgress = false
    //    @State private var shouldNavigateToHome = false
>>>>>>> Stashed changes
    
    @State private var newReport = Report.emptyReport
    @StateObject var imagePicker = ImagePicker()
    @StateObject private var reportViewModel = ReportViewModel()
    
    @State var characteristic: String = ""
    
    @State private var email: String = ""
    
    @State private var isShowingPopup: Bool = true
    
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
                                TextField("Nama peliharaan Anda", text: $newReport.petName)
                                    .onChange(of: newReport.petName){ newValue in
                                        //                                        let validationResults1 = reportViewModel.validateTextField(newValue)
                                        //                                        petNameTextField = validationResults1.isValid
                                        //                                        errorMessagePetName = validationResults1.errorMessage
                                        //                                        print("valid gk?", petNameTextField)
                                        let validationResults =
                                        reportViewModel.validateTextField(newValue)
                                        isTextFieldValid = validationResults.isValid
                                        petNameError = validationResults.errorMessage
                                        //                                        petNameError = errorMessage
                                    }
                                
                                //                                receive max 50 karakter
                                    .onReceive(newReport.petName.publisher.collect()) {
                                        let trimmedText = String($0.prefix(50)) // Limit to 50 characters
                                        if newReport.petName != trimmedText {
                                            newReport.petName = trimmedText
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
                                Text(petNameError)
                                    .foregroundColor(.red)
                                    .font(.footnote)
                                    .padding(.top, 4)
                            }
                        }
                        .padding(.horizontal)
                        
                        
                        
                        VStack(alignment: .leading) {
                            Text("Jenis Hewan")
                                .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                                .bold()
                            
                            
                            HStack {
                                Image(systemName: "fish")
                                TextField("Jenis peliharaan Anda beserta breed nya", text: $newReport.petType)
                                    .onChange(of: newReport.petType){ newValue in
                                        //                                        let validationResults = reportViewModel.validateTextField(newValue)
                                        
                                        let validationResults = reportViewModel.validateTextField(newValue)
                                        isTextFieldValid = validationResults.isValid
                                        petTypeError = validationResults.errorMessage
                                        //                                        petTypeError = errorMessage
                                        
                                    }
                                    .onReceive(newReport.petType.publisher.collect()) {
                                        let trimmedText = String($0.prefix(50)) // Limit to 50 characters
                                        if newReport.petType != trimmedText {
                                            newReport.petType = trimmedText
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
                                Text(petTypeError)
                                    .foregroundColor(.red)
                                    .font(.footnote)
                                    .padding(.top, 4)
                            }
                        }
                        .padding(.horizontal)
                        
                        
                        VStack(alignment: .leading) {
                            Text("Ciri-Ciri")
                                .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                                .bold()
//                                .onReceive(newReport.petCharacteristics.publisher.collect()) {
//                                    let trimmedText = String($0.prefix(250)) // Limit to 50 characters
//                                    if newReport.petCharacteristics != trimmedText {
//                                        newReport.petCharacteristics = trimmedText
//                                    }
//                                }
                            HStack {
                                Image(systemName: "list.dash")
                                TextField("Ciri-ciri hewan peliharaan Anda", text: $characteristic)
                                    .onReceive(characteristic.publisher.collect()) {
                                        let trimmedText = String($0.prefix(50)) // Limit to 50 characters
                                        if characteristic != trimmedText {
                                            characteristic = trimmedText
                                        }
                                    }
                                Button(action:{
                                    newReport.petCharacteristics.append(characteristic)
                                }){
                                    Image(systemName: "plus.circle.fill")
                                }
                                .tint(.black)
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)))
                                    .foregroundColor(.black)
                            )
                            
                            ForEach(newReport.petCharacteristics.indices, id: \.self) { index in
                                HStack {
                                    Image(systemName: "list.dash")
                                    TextField("Ciri-ciri hewan peliharaan Anda", text: $newReport.petCharacteristics[index])
                                        .onReceive(newReport.petCharacteristics[index].publisher.collect()) {
                                            let trimmedText = String($0.prefix(50)) // Limit to 50 characters
                                            if newReport.petCharacteristics[index] != trimmedText {
                                                newReport.petCharacteristics[index] = trimmedText
                                            }
                                        }
                                    Button(action:{
                                        newReport.petCharacteristics.append(characteristic)
                                    }){
                                        Image(systemName: "plus.circle.fill")
                                    }
                                    .tint(.black)
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)))
                                        .foregroundColor(.black)
                                )
                            }
                        }
                        .padding(.horizontal)
                        
                        //                        VStack(alignment: .leading) {
                        //                            Text("Ciri-Ciri")
                        //                                .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                        //                                .bold()
                        //
                        //                            HStack {
                        //                                Image(systemName: "list.dash")
                        //                                TextField("Kapan terakhir kali peliharaan Anda terlihat", text: $email)    // Ambil dari State di atas
                        //                                Image(systemName: "plus.circle.fill")
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
                        
                        VStack(alignment: .leading) {
                            Text("Nama Pemilik")
                                .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                                .bold()
                            
                            HStack {
                                Image(systemName: "person")
                                TextField("Nama Anda", text: $newReport.petOwner)
                                    .onReceive(newReport.petOwner.publisher.collect()) {
                                        let trimmedText = String($0.prefix(50)) // Limit to 50 characters
                                        if newReport.petOwner != trimmedText {
                                            newReport.petOwner = trimmedText
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
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading) {
                            Text("Nomor Telepon")
                                .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                                .bold()
                            
                            HStack {
                                Image(systemName: "phone")
                                TextField("Nomor telepon yang bisa dihubungi", text: $newReport.ownersPhone)
                                    .keyboardType(.numberPad)
                                    .onChange(of: newReport.ownersPhone){ newValue in
                                        
                                        let validationResults = reportViewModel.validateTextField(newValue)
                                        isTextFieldValid = validationResults.isValid
                                        ownerPhoneError = validationResults.errorMessage
                                        //                                        petTypeError = errorMessage
                                        
                                        
                                    }
                                
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)))
                                    .foregroundColor(.black)
                                
                            )
                            //                                receive max 10 karakter
                            .onReceive(newReport.ownersPhone.publisher.collect()) {
                                let trimmedText = String($0.prefix(10)) // Limit to 50 characters
                                if newReport.ownersPhone != trimmedText {
                                    newReport.ownersPhone = trimmedText
                                }
                            }
                            if !isTextFieldValid {
                                Text(ownerPhoneError)
                                    .foregroundColor(.red)
                                    .font(.footnote)
                                    .padding(.top, 4)
                            }
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading) {
                            Text("Lokasi Terakhir Dilihat")
                                .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                                .bold()
                            
                            HStack {
                                Image(systemName: "map")
                                TextField("Lokasi terakhir peliharaan Anda terlihat", text: $newReport.lastLocation)
                                    .onReceive(newReport.lastLocation.publisher.collect()) {
                                        let trimmedText = String($0.prefix(250)) // Limit to 50 characters
                                        if newReport.lastLocation != trimmedText {
                                            newReport.lastLocation = trimmedText
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
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading) {
                            Text("Tanggal Terakhir Dilihat")
                                .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                                .bold()
                            
                            HStack {
                                Image(systemName: "calendar")
                                DatePicker("Kapan terakhir kali peliharaan Anda terlihat", selection: $newReport.lastDate,
                                           in: ...Date(), displayedComponents: .date)    // Exclude the time component
                                
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
                        
                        //                        ButtonDestination(buttonIcon: "arrow.up.doc.fill", buttonText: "Ajukan Laporan") {
                        //                            HomeView()
                        //                        }
                        
                        
                        ButtonDestination(buttonIcon: "newspaper.fill", buttonText: "Ajukan Laporan") {
                             NavigationLink(destination: AddReportView()) { // Replace NavigationLink with sheet
                                 
                                 PopUpView(newReport: newReport)
                                     .navigationBarHidden(isShowingPopup)
                                 
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
