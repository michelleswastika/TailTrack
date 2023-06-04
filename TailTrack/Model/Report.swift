//
//  Laporan.swift
//  TailTrack
//
//  Created by Davina Teresa Wijaya on 22/05/23.
//

//import Foundation
import SwiftUI
import Firebase

struct Report: Identifiable {
    var id: String // Unique identifier
    
    var petName: String
    var petType: String
    var petCharacteristics: Array<String>
    var petOwner: String
    var ownersPhone: String
    var lastLocation: String
    var timestamp: Timestamp
    var lastDate: Date
    var status: String
    let imageIdentifier: String?
    var imageURL: URL?
}




//struct Report: Identifiable, Hashable{
//    var id = UUID()
//    var petName : String
//    var petType : String
//    var petCharacteristics : Array<String>
//    var petOwner : String
//    var ownersPhone : String
//    var lastLocation : String
//    var lastDate : Date
//    var status : String
//    var petPhoto : String
//
//    init(id: UUID = UUID(), petName: String, petType: String, petCharacteristics: Array<String>, petOwner: String, ownersPhone: String, lastLocation: String, lastDate: Date, status: String, petPhoto: String) {
//        self.id = id
//        self.petName = petName
//        self.petType = petType
//        self.petCharacteristics = petCharacteristics
//        self.petOwner = petOwner
//        self.ownersPhone = ownersPhone
//        self.lastLocation = lastLocation
//        self.lastDate = lastDate
//        self.status = status
//        self.petPhoto = petPhoto
//    }
//}
//
//extension Report{
//
//    static var emptyReport: Report{
//        Report(petName: "", petType: "", petCharacteristics: [], petOwner: "", ownersPhone: "", lastLocation: "", lastDate: Date(), status: "", petPhoto: "")
//    }
//}
