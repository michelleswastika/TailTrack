//
//  DataManager.swift
//  TailTrack
//
//  Created by Nael on 29/05/23.
//

//import SwiftUI
//import Firebase
//
//class DataManager: ObservableObject {
//
//    @Published var reports: [Report] = []
//
//    init() {
//        fetchReports()
//    }
//
//    func fetchReports() {
//        reports.removeAll()
//        let db = Firestore.firestore()
//        let ref = db.collection("Reports")
//        ref.getDocuments { snapshot, error in
//            guard error == nil else {
//                print(error?.localizedDescription as Any)
//                return
//            }
//            if let snapshot = snapshot {
//                for document in snapshot.documents {
//                    let data = document.data()
//
//                    let id = data["id"] as? String ?? ""
//                    let petName = data["petName"] as? String ?? ""
//                    let petType = data["petType"] as? String ?? ""
//                    let petCharacteristics = data["petCharacteristics"] as? Array<String>
//                    let petOwner = data["petType"] as? String ?? ""
//                    let ownersPhone = data["petType"] as? String ?? ""
//                    let lastLocation = data["petType"] as? String ?? ""
//                    let lastDate = data["petType"] as? Date
//                    let status = data["petType"] as? String ?? ""
//
//                    let report = Report(id: id, petName: petName, petType: petType, petCharacteristics: petCharacteristics ?? ["Kosong"], petOwner: petOwner, ownersPhone: ownersPhone, lastLocation: lastLocation, lastDate: lastDate ?? Date(), status: status, petPhoto: "")
//                }
//            }
//        }
//    }
//}
