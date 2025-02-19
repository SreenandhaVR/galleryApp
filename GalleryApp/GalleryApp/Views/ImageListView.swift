//
//  ImageListView.swift
//  GalleryApp
//
//  Created by ICODEBEES on 19/02/25.
//
import SwiftUI

struct ImageListView: View {
    @State private var images: [UnsplashImage] = []
    @State private var searchText = ""
    let unsplashService = UnsplashService()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search...", text: $searchText, onCommit: {
                    unsplashService.fetchImages(query: searchText) { fetchedImages in
                        images = fetchedImages ?? []
                    }
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                        ForEach(images, id: \.id) { image in
                            NavigationLink(destination: FullScreenImageView(image: image)) {
                                AsyncImage(url: URL(string: image.urls["small"] ?? "")) { phase in
                                    if let image = phase.image {
                                        image.resizable().scaledToFill()
                                    } else {
                                        Color.gray
                                    }
                                }
                                .frame(height: 150)
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Unsplash Images")
            .onAppear {
                unsplashService.fetchImages { fetchedImages in
                    images = fetchedImages ?? []
                }
            }
        }
    }
}
