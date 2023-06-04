//
//  ReportDetailView.swift
//  TailTrack
//
//  Created by Michelle Swastika on 26/05/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseStorage

struct ReportDetailView: View {
    
    let report: Report
    @State private var imageURL: URL? = nil
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            NavigationStack {
                ScrollView {
                    VStack {
                        Text(report.petName)
                            .font(.title)
                            .bold()
                        Text(report.petType)
                            .padding(.top, 1)
                            .padding(.bottom, 15)
                            .foregroundColor(.gray)
                        
                        
                        //    PET PICTURES
                        
                        if let imageURL = imageURL {
                            AsyncImage(url: imageURL) { phase in
                                switch phase {
                                case .empty:
                                    // Placeholder or loading view
                                    ProgressView()
                                case .success(let image):
                                    // Display the image
                                    image
                                        .resizable()
                                        .frame( width: 220, height: 220)
                                        
                                case .failure:
                                    // Error view or fallback image
                                    // Display an error message or a placeholder/fallback image
                                    Text("Failed to load image")
                                @unknown default:
                                    // Handle future cases if needed
                                    Text("Failed to load image")
                                }
                            }
                        } else {
                            Text("No image available")
                        }
                        
                        
                        //    PET CHARACTERISTICS
                        
                        VStack(){
                            Text("Ciri-ciri :")
                                .bold()
                                .padding(.top, 15)
                                .font(.system(size: 22))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(){
                                ForEach(report.petCharacteristics, id: \.self) { petCharacteristic in
                                    Text("• " + petCharacteristic)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            .font(.system(size: 18))
                        }
                        .padding(.leading, 30)
                        
                        VStack {
                            //    OWNER'S NAME
                            
                            DetailContent(
                                contentTitle: "Nama pemilik:",
                                contentText: report.petOwner)
                            
                            
                            //     PHONE NUMBER
                            
                            DetailContent(
                                contentTitle: "Nomor relepon pemilik:",
                                contentText: report.ownersPhone)
                            
                            
                            //     LAST LOCATION
                            
                            DetailContent(
                                contentTitle: "Lokasi terakhir dilihat:",
                                contentText: report.lastLocation)
                            
                            
                            //     LAST DATE
                            
                            DetailContent(
                                contentTitle: "Tanggal terakhir dilihat:",
                                contentText: formatTimestamp(report.timestamp) ?? "")
                            
                            //     STATUS
                            
                            DetailContent(
                                contentTitle: "Status:",
                                contentText: report.status)
                        }
                        
                        //     BUTTON
                        
                        VStack {
                            
                            ValidationButton(buttonIcon: "checkmark.square.fill", buttonText: "Sudah ditemukan") {
                                HomeView()
                            }
                        }
                        .padding(.top, 30)
                        
                        Spacer()
                    }
                }
                .onAppear {
                    fetchImageURL()
                }

            }
        }
    }
    
    
    //     TIMESTAMP TO STRING
    //     Value for Date is Timestamp, but here we need it to be a String value in order to put it on a Text(), thus we change the data type
    
    private func formatTimestamp(_ timestamp: Timestamp) -> String? {
        let date = timestamp.dateValue()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "id_ID")
        dateFormatter.dateStyle = .full
        //            dateFormatter.timeStyle = .short      => waktu
        
        return dateFormatter.string(from: date)
    }
    
    
    //     FETCH IMAGE FROM FIREBASE STORAGE
    
    func fetchImageURL() {
        guard let imageIdentifier = report.imageIdentifier else {
            print("Image identifier is nil")
            return
        }

        let storageRef = Storage.storage().reference()
        let imageRef = storageRef.child("images/\(imageIdentifier).jpg")
        
        imageRef.downloadURL { url, error in
            if let error = error {
                print("Failed to fetch image URL: \(error.localizedDescription)")
                return
            }
            
            imageURL = url
        }
    }

    
}

struct ReportDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ReportDetailView(report: Report(id: "1", petName: "Fluffy", petType: "Cat", petCharacteristics: [], petOwner: "Nael", ownersPhone: "12345678", lastLocation: "UC", timestamp: Timestamp(), lastDate: Date(), status: "Missing", imageIdentifier: ""))
    }
}
