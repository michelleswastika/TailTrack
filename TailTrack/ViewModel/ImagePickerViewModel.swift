//
//  ImagePickerViewModel.swift
//  TailTrack
//
//  Created by Michelle Alvera on 26/05/23.
//

import SwiftUI
import PhotosUI
import FirebaseStorage

@MainActor
class ImagePicker: ObservableObject {
    
    @Published var image: Image?
    @Published var imageIdentifier: String?
    @Published var imageSelection: PhotosPickerItem? {
            didSet {
                if let imageSelection = imageSelection {
                    Task {
                        try await loadTransferable(from: imageSelection)
                        //await uploadImage()
                    }
                }
            }
        }
    
    private var storageRef = Storage.storage().reference()
    private var imageRef: StorageReference?
    
    func loadTransferable(from imageSelection: PhotosPickerItem?) async throws {
            do {
                if let data = try await imageSelection?.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        self.image = Image(uiImage: uiImage)
                    }
                }
            } catch {
                print("Failed to load image: \(error.localizedDescription)")
                image = nil
            }
        }
    
    func uploadImage(imageIdentifier: String, completion: @escaping (Result<String, Error>) -> Void) async {
        guard let imageSelection = imageSelection else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No image selection"])))
            return
        }

        let imageName = UUID().uuidString
        let imageRef = storageRef.child("images/\(imageName).jpg")

        do {
            if let data = try await imageSelection.loadTransferable(type: Data.self) {
                imageRef.putData(data, metadata: nil) { metadata, error in
                    if let error = error {
                        completion(.failure(error))
                        return
                    }

                    print("Image uploaded successfully.")
                    self.imageIdentifier = imageName
                    completion(.success(imageName))
                }
            }
        } catch {
            completion(.failure(error))
        }
    }
    
}
