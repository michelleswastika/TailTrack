//
//  LandingPageView.swift
//  TailTrack
//
//  Created by Nael on 25/05/23.
//

import SwiftUI

struct LandingPageView: View {
    var body: some View {
        
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            NavigationView {
                
                VStack {
                    
                    //                  ========= HEADER =========

                    
                    Header(
                        headerTitle: "TailTrack",
                        headerSubTitle: "Continue as...")
                    
                    Spacer()
                    
                    //                  ========= PEMILIK HEWAN =========

                    
                    ButtonDestination(buttonIcon: "person.2.fill", buttonText: "Pemilik Hewan / Sukarelawan") {
                        HomeView(reportLists: [Report]())
                    }
                    
                    //                  ========= ADMINISTRATOR =========

                    
                    ButtonDestination(buttonIcon: "gearshape.fill", buttonText: "Administrator") {
                        LoginView()
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                }
                
            }
        }
        
        
        
    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}
