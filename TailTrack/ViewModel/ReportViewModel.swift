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
//            var isTextFieldValid: Bool = true
//            var errorMessage: String = ""
            
            if emojiInside || itIsEmpty.isEmpty {
                return (false, emojiInside ? "Text field cannot contain emojis." : "Text field cannot be empty.")
            } else {
                return (true, "")
            }
        }
        
        func validateFields(_ newValue: String) -> (isValid: Bool, errorMessage: String) {
            print("inside validate fields")
                let valueResult = validateTextField(newValue)
//                let petTypeResults = validateTextField(petType)
                
                if !valueResult.isValid {
                    print("error message:", valueResult.errorMessage)
                    return (false, valueResult.errorMessage)
                    print("after return error message")
                } else {
                    print("no error message :D")
                    return (true, "")
                }
            }
        
        
        func addReport(petName: String, petType: String, petCharacteristics: Array<String>, petOwner: String, ownersPhone: String, lastLocation: String, lastDate: Date, status: String, petPhoto: String){
            let newReport = Report(petName: petName, petType: petType, petCharacteristics: petCharacteristics, petOwner: petOwner, ownersPhone: ownersPhone, lastLocation: lastLocation, lastDate: lastDate, status: status, petPhoto: petPhoto)
            reports.append(newReport)
        }
        
        func validateReport(){
            
        }
        
    }
