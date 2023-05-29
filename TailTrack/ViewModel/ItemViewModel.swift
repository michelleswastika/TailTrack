//
//  ItemViewModel.swift
//  TailTrack
//
//  Created by Nael on 29/05/23.
//

import Foundation

class ItemViewModel: ObservableObject {
    @Published var items: [Item] = []
    private let firestoreService = FirestoreService()
    
    func fetchItems() {
        firestoreService.fetchItems { [weak self] items in
            DispatchQueue.main.async {
                self?.items = items
            }
        }
    }
}
