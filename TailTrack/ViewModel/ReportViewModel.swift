//
//  LaporanViewModel.swift
//  TailTrack
//
//  Created by Davina Teresa Wijaya on 22/05/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseStorage

@MainActor class ReportViewModel: ObservableObject {
    @Published var reports = [Report]()
    private var imageURLs = [String: URL]()  // Dictionary to store image URLs
    
    private let firestoreServices = FirestoreServices()
    
    func fetchItems() {
        firestoreServices.fetchItems { [weak self] reports in
            DispatchQueue.main.async {
                self?.reports = reports
                self?.fetchImageURLs()  // Fetch image URLs for the reports
            }
        }
    }
    
    private func fetchImageURLs() {
        for report in reports {
            guard let imageIdentifier = report.imageIdentifier else {
                continue
            }
            
            let storageRef = Storage.storage().reference()
            let imageRef = storageRef.child("images/\(imageIdentifier).jpg")
            
            imageRef.downloadURL { [weak self] url, error in
                if let error = error {
                    print("Failed to fetch image URL: \(error.localizedDescription)")
                    return
                }
                
                if let imageURL = url {
                    self?.imageURLs[report.id] = imageURL  // Store the image URL in the dictionary
                }
            }
        }
    }
    
    // Retrieve the image URL for a report by its id
    func getImageURL(for report: Report) -> URL? {
        return imageURLs[report.id]
    }
    
    func addReport(
        petName: String,
        petType: String,
        petCharacteristics: [String],
        petOwner: String,
        ownersPhone: String,
        lastLocation: String,
        lastDate: Date,
        status: String,
        imageIdentifier: String
    ) {
        firestoreServices.addReport(
            petName: petName,
            petType: petType,
            petCharacteristics: petCharacteristics,
            petOwner: petOwner,
            ownersPhone: ownersPhone,
            lastLocation: lastLocation,
            lastDate: lastDate,
            status: status,
            imageIdentifier: imageIdentifier
        )
    }
    
    func validateTextField(_ newValue: String)-> (isValid: Bool, errorMessage: String){
        let emojiInside = containsEmoji(text: newValue)
        let itIsEmpty = newValue.trimmingCharacters(in: .whitespacesAndNewlines)
        let phoneInvalid = newValue.starts(with: "62")
        
        if emojiInside {
            return (false, "Jenis Hewan Tidak Valid.")
        } else if itIsEmpty.isEmpty{
            return (false, "Invalid Input.")
        }else if phoneInvalid {
            return (false, "Phone Invalid.")
        }else {
            return (true, "")
        }
    }

    func containsEmoji(text: String) -> Bool {
        let scalarView = text.unicodeScalars
        
        for scalar in scalarView {
            switch scalar.value {
            case 0x1F600...0x1F64F, 0x1F300...0x1F5FF, 0x1F680...0x1F6FF, 0x2600...0x26FF, 0x2700...0x27BF, 0xE0020...0xE007F:
                return true
            default:
                continue
            }
        }
        return false
    }
    
}
