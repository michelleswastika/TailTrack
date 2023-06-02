//
//  LaporanViewModel.swift
//  TailTrack
//
//  Created by Davina Teresa Wijaya on 22/05/23.
//

import Foundation
import SwiftUI

    @MainActor class ReportViewModel: ObservableObject{
        @Published var reports = [Report]()
//        @Published var status: String = "sedang mencari"
        
        func validateTextField(_ newValue: String)-> (isValid: Bool, errorMessage: String){
            let emojiInside = newValue.containsEmoji
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
        
<<<<<<< Updated upstream
=======
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
        
        func addReport(
            petName: String,
            petType: String,
            petCharacteristics: [String],
            petOwner: String, ownersPhone: String,
            lastLocation: String,
            lastDate: Date,
            status: String,
            imageIdentifier: String) {
                firestoreServices.addReport(petName: petName, petType: petType, petCharacteristics: petCharacteristics, petOwner: petOwner, ownersPhone: ownersPhone, lastLocation: lastLocation, lastDate: lastDate, status: status, imageIdentifier: imageIdentifier)
            }
        
>>>>>>> Stashed changes
//        func validateFields(_ newValue: String) -> (isValid: Bool, errorMessage: String) {
//            print("inside validate fields")
//                let valueResult = validateTextField(newValue)
////                let petTypeResults = validateTextField(petType)
//
//                if !valueResult.isValid {
//                    print("error message:", valueResult.errorMessage)
//                    return (false, valueResult.errorMessage)
////                    print("after return error message")
//                } else {
//                    print("no error message :D")
//                    return (true, "")
//                }
//            }
        
//        func validateFields(_ newValue: String) {
//            let petNameResults = validateTextField(newReport.petName)
//            let petTypeResults = validateTextField(newReport.petType)
//            
//            if !petNameResults.isValid {
//                isTextFieldValid = false
//                errorMessage = petNameResults.errorMessage
//            } else if !petTypeResults.isValid {
//                isTextFieldValid = false
//                errorMessage = petTypeResults.errorMessage
//            } else {
//                isTextFieldValid = true
//                errorMessage = ""
//            }
//        }

        
        
        func addReport(petName: String, petType: String, petCharacteristics: Array<String>, petOwner: String, ownersPhone: String, lastLocation: String, lastDate: Date, status: String, petPhoto: String){
            let newReport = Report(petName: petName, petType: petType, petCharacteristics: petCharacteristics, petOwner: petOwner, ownersPhone: ownersPhone, lastLocation: lastLocation, lastDate: lastDate, status: status, petPhoto: petPhoto)
            reports.append(newReport)
        }
        
        func validateReport(){
            
        }
        
    }
