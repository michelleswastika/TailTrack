//
//  ImagePickerView.swift
//  TailTrack
//
//  Created by MacBook Pro on 26/05/23.
//

import SwiftUI
import PhotosUI

struct ImagePickerView: View {
    
    @StateObject var imagePicker = ImagePicker()
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                if let image = imagePicker.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else {
                    Text("Upload Foto")
                }
                
            }
            .padding()
            .navigationTitle("Picker")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    PhotosPicker(selection: $imagePicker.imageSelection,
                                 matching: .images,
                                 photoLibrary: .shared()) {
                        Image(systemName: "photo")
                            .imageScale(.large)
                    }
                }
            }
        }
        
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}
