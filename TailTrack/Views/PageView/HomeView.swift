//
//  HomeView.swift
//  TailTrack
//
//  Created by Michelle Alvera on 25/05/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var email: String = ""
    
    let countries = countryList
    
    var body: some View {
        
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            NavigationStack {
                
                VStack {
                    
                    HStack {}
                        .padding(.top)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                NavigationLink(destination: AddReportView()) {
                                    Image(systemName: "plus")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    
                    //                    Text("Home")
                    //                        .font(.title)
                    //                        .bold()
                    //                        .padding(.top)
                    //
                    //
                    //                    HStack {
                    //                        Image(systemName: "plus")
                    //                            .resizable()
                    //                            .frame(width: 20, height: 20)
                    //                        Text("Tambah")
                    //                            .font(.title3)
                    //                        Spacer()
                    //                    }
                    //                    .padding(.horizontal)
                    //                    .foregroundColor(.blue)
                    
                    VStack(alignment: .leading) {
                        
                        HStack {
                            TextField("Search", text: $email)
                            Image(systemName: "magnifyingglass")
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)))
                                .foregroundColor(.black)
                            
                        )
                        .padding(.top)
                    }
                    .padding(.horizontal)
                    
                    
                    List {
                        ForEach(countries, id: \.self) { country in
                            NavigationLink(destination: Text(country)) {
                                Image("vera sip")
                                    .resizable().frame(width: 62, height: 60)
                                VStack (alignment: .leading) {
                                    Text(country)
                                    Text("Anak kucing")
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                }
                            }.padding()
                        }
                    }
                    .listStyle(.plain)
                    
                    
                }
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}