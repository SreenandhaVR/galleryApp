//
//  UnsplashImage.swift
//  GalleryApp
//
//  Created by ICODEBEES on 19/02/25.
//

import Foundation

struct UnsplashImage: Decodable {
    let id: String
    let urls: [String: String]
    let description: String?
}

struct UnsplashResponse: Decodable {
    let results: [UnsplashImage]
}

