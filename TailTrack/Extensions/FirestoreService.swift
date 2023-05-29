//
//  FirestoreService.swift
//  TailTrack
//
//  Created by Michelle Alvera on 29/05/23.
//

import Foundation
import FirebaseFirestore

class FirestoreService {
    private let db = Firestore.firestore()
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    func fetchItems(completion: @escaping ([Item]) -> Void) {
        db.collection("Reports").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching items: \(error.localizedDescription)")
                completion([])
                return
            }
            
            var items: [Item] = []
            for document in snapshot?.documents ?? [] {
                let data = document.data()
                let id = document.documentID
                let petName = data["petName"] as? String ?? ""
                let petCharacteristics = data["petCharacteristics"] as? Array<String>
                let timestamp = data["lastDate"] as? Timestamp ?? Timestamp(date: Date())
                let lastDate = timestamp.dateValue()
                let item = Item(id: id, petName: petName, petCharacteristics: petCharacteristics ?? [""], lastDate: lastDate)
                items.append(item)
            }
            
            completion(items)
        }
    }
}
