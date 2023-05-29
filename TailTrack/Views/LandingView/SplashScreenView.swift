//
//  SplashScreenView.swift
//  TailTrack
//
//  Created by Michelle Alvera on 29/05/23.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State var loadComplete: Bool = false
    
    var body: some View {
        ZStack {
                    if self.loadComplete {
                        LandingPageView()
                    } else {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation {
                            self.loadComplete = true
                        }
                    }
                }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
