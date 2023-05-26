//
//  ValidationButton.swift
//  TailTrack
//
//  Created by Michelle Swastika on 26/05/23.
//

import SwiftUI

struct PopUpButton<Destination: View>: View {
    
    var buttonIcon: String
    var buttonText: String
    var buttonDestination: () -> Destination
    
    var body: some View {
        
        VStack {
            
            Button(action: {}) {
                NavigationLink(
                    destination: buttonDestination()
                        .navigationBarBackButtonHidden(true),
                    label: {
                        HStack {
                            Image(systemName: buttonIcon)
                            Text(buttonText)
                                .foregroundColor(.black)
                        }
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 1.00)))
                        )
                        .padding(.horizontal)
                    }
                )
            }
            .padding(.top)
        }
        
    }
}


struct PopUpButton_Previews: PreviewProvider {
    static var previews: some View {
        PopUpButton<Text>(
            buttonIcon: "gear",
            buttonText: "Button Example",
            buttonDestination: {
                Text("Settings View")
            }
        )
    }
}
