//
//  HomeAdminView.swift
//  TailTrack
//
//  Created by Michelle Alvera on 26/05/23.
//

import SwiftUI

struct HomeAdminView: View {
    @State private var email: String = ""
    @StateObject private var reportViewModel = ReportViewModel()
    
    var body: some View {
        
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            NavigationStack {
                
                VStack {
                    
                    HStack {}
                        .padding(.top)
                        .navigationTitle("Home Admin")
                        .navigationBarTitleDisplayMode(.inline)
                    
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
                    
                    
                    List(reportViewModel.reports) { report in
                        NavigationLink(destination: ReportDetailView(report: report)) {
                            if let imageURL = reportViewModel.getImageURL(for: report) {
                                AsyncImage(url: imageURL) { phase in
                                    switch phase {
                                    case .empty:
                                        // Placeholder or loading view
                                        ProgressView()
                                    case .success(let image):
                                        // Display the image
                                        image
                                            .resizable()
                                            .frame(width: 62, height: 60)
                                    case .failure:
                                        // Error view or fallback image
                                        Text("Failed to load image")
                                    @unknown default:
                                        // Handle future cases if needed
                                        Text("Failed to load image")
                                    }
                                }
                            } else {
                                Image("logo1024")
                                    .resizable()
                                    .frame(width: 62, height: 60)
                            }
                            
                            VStack (alignment: .leading) {
                                Text(report.petName)
                                Text(report.petType + " milik " + report.petOwner)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                    }
                    .listStyle(.plain)
                    .onAppear {
                        reportViewModel.fetchItems()
                    }
                    
                    
                }
            }
        }
        
    }
}

struct HomeAdminView_Previews: PreviewProvider {
    static var previews: some View {
        HomeAdminView()
    }
}
