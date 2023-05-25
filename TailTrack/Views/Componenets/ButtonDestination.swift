//
//  ButtonDestination.swift
//  TailTrack
//
//  Created by Nael on 25/05/23.
//

import SwiftUI

struct ButtonDestination<Destination: View>: View {
    
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
                                .fill(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                        )
                        .padding(.horizontal)
                    }
                )
            }
            .padding(.top)
        }
        
    }
}


struct ButtonDestination_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDestination<Text>(
            buttonIcon: "gear",
            buttonText: "Button Example",
            buttonDestination: {
                Text("Settings View")
            }
        )
    }
}
