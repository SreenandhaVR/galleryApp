//
//  ContentView.swift
//  GalleryApp
//
//  Created by ICODEBEES on 19/02/25.
//

import SwiftUI

struct ContentView: View {
    @State var selection = 1
      
      var body: some View {
          TabView(selection: $selection) {
              ImageListView().tabItem {
                  Image(systemName: "photo.on.rectangle.angled")
                  Text("Images")
              }.tag(1)
              
              Text("Favorites").tabItem {
                  Image(systemName: "star.fill")
                  Text("Favorites")
              }.tag(2)
          }
      }
  }

#Preview {
    ContentView()
}
