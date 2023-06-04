//
//  HomeView.swift
//  TailTrack
//
//  Created by Michelle Alvera on 25/05/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var reportViewModel = ReportViewModel()
    
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
                                Text("No image available")
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

