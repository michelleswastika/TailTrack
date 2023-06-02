//
//  ButtonAction.swift
//  TailTrack
//
//  Created by Michelle Alvera on 29/05/23.
//

import SwiftUI

struct ButtonAction: View {
    
    @State var showingAlert = false
    @StateObject var reportViewModel = ReportViewModel()
    
    var newPetName: String
    var newPetType: String
    var newPetCharacteristics: [String]
    var newPetOwner: String
    var newOwnersPhone: String
    var newLastLocation: String
    var newLastDate: Date
    
    var body: some View {
        //Copy of ButtonDestination but with no Destination, if user choose "Ya" then it will be directed to HomeView()
        Button(action: { showingAlert = true }){
            NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true), label: {
                HStack {
                    Image(systemName: "arrow.up.doc.fill")
                    Text("Ajukan Laporan")
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
            })
                           }
                .padding(.top)
                .alert(isPresented: $showingAlert){
                    Alert(title: Text("Konfirmasi Laporan"),
                          message: Text("Apakah Anda yakin ingin mengajukan laporan ini?"),primaryButton: .default(Text("Ya"), action: {
                        reportViewModel.addReport(petName: newPetName, petType: newPetType, petCharacteristics: newPetCharacteristics, petOwner: newPetOwner, ownersPhone: newOwnersPhone, lastLocation: newLastLocation, lastDate: newLastDate, status: "Menunggu validasi", imageIdentifier: "")
                    }), secondaryButton: .destructive(Text("Tidak")))
                }
        }
        
    }
    
//    struct ButtonAction_Previews: PreviewProvider {
//        static var previews: some View {
//            ButtonAction(newPetName: <#String#>, newPetType: <#String#>, newPetOwner: <#String#>, newOwnersPhone: <#String#>, newLastLocation: <#String#>)
//        }
//    }
