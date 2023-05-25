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
                    
                    
                    //                  ========= HEADER =========
                    
                    Header(headerTitle: "Log In",
                           headerSubTitle: "Selamat datang kembali, Admin!")
                    
                    
                    //                  ========= KOLOM USERNAME LABEL =========
                    
                    VStack (alignment: .leading) {
                        
                        Text("Username")
                            .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                            .bold()
                        
                        HStack {
                            Image(systemName: "mail")
                            TextField("Username", text: $email)    // Ambil dari State di atas
                            
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
                    .padding(.horizontal)
                    
                    
                    //                  ========= PASSWORD LABEL =========
                    
                    VStack (alignment: .leading) {
                        
                        Text("Password")
                            .foregroundColor(Color(UIColor(red: 0.91, green: 0.44, blue: 0.32, alpha: 1.00)))
                            .bold()
                        
                        HStack {
                            Image(systemName: "lock")
                            TextField("Password", text: $password)    // Ambil dari State di atas
                            
                            if(password.count >= 1) {
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
                    
                    
                    //                  ========= LOGIN BUTTON =========
                    
                    VStack {
                        
                        Button(action: {}) {
                            NavigationLink(
                                destination: AddReportView()
                                    .navigationBarBackButtonHidden(true),
                                label: {
                                    Text("Log In")
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
                    
                    
                    //                    ======== BUTTON NAVIGATE TO SignUpView() ========
                    
                    //                    Button(action: {}) {
                    //                        NavigationLink(
                    //                            destination: SignUpView()
                    //                                .navigationBarBackButtonHidden(true),
                    //                            label: {
                    //                                Text("Don't have an account?")
                    //                                    .foregroundColor(.black.opacity(0.7))
                    //                            }
                    //                        )
                    //                    }
                    
                    Spacer()
                    Spacer()
                    
                    
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
