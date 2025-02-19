//
//  FullScreenImageView.swift
//  GalleryApp
//
//  Created by ICODEBEES on 19/02/25.
//
import SwiftUI

struct FullScreenImageView: View {
    let image: UnsplashImage
    @State private var isShareSheetPresented = false

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: image.urls["regular"] ?? "")) { phase in
                if let image = phase.image {
                    image.resizable().scaledToFit()
                } else {
                    Color.gray
                }
            }
            
            Text(image.description ?? "No description")
                .font(.caption)
                .padding()
            
            Button("Share") {
                isShareSheetPresented = true
            }
            .padding()
            .sheet(isPresented: $isShareSheetPresented) {
                if let url = URL(string: image.urls["regular"] ?? "") {
                    ShareSheet(activityItems: [url])
                }
            }

            Spacer()
        }
        .navigationTitle("Image Details")
    }
}
