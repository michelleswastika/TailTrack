//
//  LoginView.swift
//  TailTrack
//
//  Created by MacBook Pro on 08/05/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Selamat Datang Kembali!")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                }
                .padding()
                .padding(.top)
                
                Spacer()
                
                HStack {
                    Image(systemName: "mail")
                    TextField("Email", text: $email)    // Ambil dari State di atas
                    
                    Spacer()
                    
                    if(email.contains("@gmail.com")) {
                        Image(systemName: "checkmark")
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                    }
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 0.5)
                        .foregroundColor(.black)
                )
                
                .padding()
                
                HStack {
                    Image(systemName: "lock")
                    TextField("Password", text: $password)    // Ambil dari State di atas
                    
                    Spacer()
                    
                    if(password.count >= 8) {
                        Image(systemName: "checkmark")
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                    }
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 0.5)
                        .foregroundColor(.black)
                )
                
                .padding()
                
                Button(action: {}) {
                    Text("Belum punya akun?")
                        .foregroundColor(.black.opacity(0.7))
                }
                
                Spacer()
                Spacer()
                
                Button {
                    
                } label : {
                    Text("Sign In Nigga!")
                        .foregroundColor(.white)
                        .font(.title2)
                        .bold()
                    
                        .frame(maxWidth: .infinity)
                        .padding()
                    
                        .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.black)
                        )
                        .padding(.horizontal)
                }
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
