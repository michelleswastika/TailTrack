//
//  Item.swift
//  TailTrack
//
//  Created by Michelle Alvera on 29/05/23.
//

import Foundation

struct Item: Identifiable {
    let id: String
    let petName: String
    let petCharacteristics: Array<String>
    let lastDate: Date
}
