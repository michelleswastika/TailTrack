//
//  FirestoreServices.swift
//  TailTrack
//
//  Created by Michelle Alvera on 29/05/23.
//

import Foundation
import FirebaseFirestore

class FirestoreServices {
    private let db = Firestore.firestore()
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    func fetchItems(completion: @escaping ([Report]) -> Void) {
        db.collection("Reports").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching items: \(error.localizedDescription)")
                completion([])
                return
            }
            
            var reports: [Report] = []
            for document in snapshot?.documents ?? [] {
                let data = document.data()
                let id = document.documentID
                let petName = data["petName"] as? String ?? ""
                let petType = data["petType"] as? String ?? ""
                let petCharacteristics = data["petCharacteristics"] as? Array<String>
                let petOwner = data["petOwner"] as? String ?? ""
                let ownersPhone = data["ownersPhone"] as? String ?? ""
                let lastLocation = data["lastLocation"] as? String ?? ""
                let timestamp = data["lastDate"] as? Timestamp ?? Timestamp(date: Date())
                let lastDate = timestamp.dateValue()
                let status = data["status"] as? String ?? ""
                let imageIdentifier = data["imageIdentifier"] as? String ?? ""
                let report = Report(id: id, petName: petName, petType: petType, petCharacteristics: petCharacteristics ?? [""], petOwner: petOwner, ownersPhone: ownersPhone, lastLocation: lastLocation, timestamp: timestamp, lastDate: lastDate, status: status, imageIdentifier: imageIdentifier)
                reports.append(report)
            }
            
            completion(reports)
        }
    }
    
    func addReport(petName: String, petType: String, petCharacteristics: [String], petOwner: String, ownersPhone: String, lastLocation: String, lastDate: Date, status: String, imageIdentifier: String) {
            let docData: [String: Any] = [
                "petName": petName,
                "petType": petType,
                "petCharacteristics": petCharacteristics,
                "petOwner": petOwner,
                "ownersPhone": ownersPhone,
                "lastLocation": lastLocation,
                "lastDate": lastDate,
                "status": status,
                "imageIdentifier": imageIdentifier
            ]
            
            db.collection("Reports").addDocument(data: docData) { error in
                if let error = error {
                    print("Error adding item: \(error.localizedDescription)")
                } else {
                    print("Report added successfully")
                }
            }
        }
    
}
