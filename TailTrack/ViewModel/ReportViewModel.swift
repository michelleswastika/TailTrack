//
//  LaporanViewModel.swift
//  TailTrack
//
//  Created by Davina Teresa Wijaya on 22/05/23.
//

import Foundation

@MainActor
class ReportViewModel: ObservableObject{
    @State private var reports = [Report]()
    
    func addReport(){
        reports.append()
    }
}
