//
//  Laporan.swift
//  TailTrack
//
//  Created by Davina Teresa Wijaya on 22/05/23.
//

import Foundation

struct Report: Identifiable, Hashable{
    let id = UUID()
    var petName : String
    var petType : String
    var petCharacteristics : Array<String>
    var petOwner : String
    var ownersPhone : String
    var lastLocation : String
    var lastDate : Date
    var status : String
    var petPhoto : String
}

extension Report{
//    struct Cast: Identifiable, Codable{
//        let id: UUID
//        let name: String
//        
//        init(id:UUID = UUID(), name: String){
//            self.id = id
//            self.name = name
//        }
//    }
    
    static var emptyReport: Report{
        Report(petName: "", petType: "", petCharacteristics: [], petOwner: "", ownersPhone: "", lastLocation: "", lastDate: Date(), status: "sedang mencari", petPhoto: "")
    }
    
    
}
