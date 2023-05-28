//
//  SignUpView.swift
//  TailTrack
//
//  Created by Nael on 08/05/23.
//

import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    private func isValidPassword(_ password: String) -> Bool {
        // minimum 6 characters  long
        // 1 uppercase letter
        // 1 special char
        
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        
        return passwordRegex.evaluate(with: password)
    }
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            NavigationView {
                
                VStack {
                    
                    VStack {
                        
                        Circle()
                            .frame(maxWidth: 80)
                            .padding(.top, 40)
                        
                        
                        Text("Registrasi")
                            .font(.title)
                            .bold()
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                        
                        Text("Silakan buat akun baru!")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                    }
                    .padding(.bottom, 40)
                    
                    VStack (alignment: .leading) {
                        
                        Text("Email")
                            .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                            .bold()
                        
                        HStack {
                            Image(systemName: "mail")
                            TextField("Email Anda", text: $email)    // Ambil dari State di atas
                                .keyboardType(.asciiCapable)
                                .autocorrectionDisabled(true)
                                .textInputAutocapitalization(.never)
                            Spacer()
                            
                            if(email.count != 0) {
                                Image(systemName: email.isValidEmail() ?  "checkmark" : "xmark")
                                    .fontWeight(.bold)
                                    .foregroundColor(email.isValidEmail() ? .green : .red)
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)))
                                .foregroundColor(.black)
                            
                        )
                    }
                    
                    .padding()
                    
                    VStack (alignment: .leading) {
                        
                        Text("Password")
                            .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                            .bold()
                        
                        HStack {
                            Image(systemName: "lock")
                            SecureField("Password Anda", text: $password) // Ambil dari State di atas
                                .keyboardType(/*@START_MENU_TOKEN@*/.asciiCapable/*@END_MENU_TOKEN@*/)
                                .autocorrectionDisabled(true)
                            
                            Spacer()
                            
                            if(password.count >= 8) {
                                Image(systemName: isValidPassword(password) ? "checkmark" : "xmark")
                                    .fontWeight(.bold)
                                    .foregroundColor(isValidPassword(password) ? .green : .red)
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)))
                                .foregroundColor(.black)
                            
                        )
                    }
                    
                    .padding()
                    
                    ButtonDestination(buttonIcon: "", buttonText: "Registrasi") {
                        LandingPageView()
                    }
                    
                    Button(action: {}) {
                        NavigationLink(
                            destination: LoginView()
                                .navigationBarBackButtonHidden(true),
                            label: {
                                Text("Sudah punya akun?")
                                    .foregroundColor(.black.opacity(0.7))
                            }
                        )
                    }
                    
                    Spacer()
                    Spacer()
                    
                    
                    
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
