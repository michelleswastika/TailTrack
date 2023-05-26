//
//  ValidationButton.swift
//  TailTrack
//
//  Created by Michelle Swastika on 26/05/23.
//

import SwiftUI

struct ValidationButton<Destination: View>: View {
    
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
                        }
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(UIColor(red: 0.165, green: 0.616, blue: 0.565, alpha: 1.00)))
                        )
                        .padding(.horizontal)
                    }
                )
            }
            .padding(.top)
        }
        
    }
}


struct ValidationButton_Previews: PreviewProvider {
    static var previews: some View {
        ValidationButton<Text>(
            buttonIcon: "gear",
            buttonText: "Button Example",
            buttonDestination: {
                Text("Settings View")
            }
        )
    }
}
