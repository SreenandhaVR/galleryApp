//
//  UnsplashService.swift
//  GalleryApp
//
//  Created by ICODEBEES on 19/02/25.
//

import Foundation

class UnsplashService {
    private let accessKey = "kooI__lyMbVVlOXuQi7JMcA5XrXPy54I2wBy1Ye7mec"
    
    // Fetch images from Unsplash API
    func fetchImages(query: String = "nature", completion: @escaping ([UnsplashImage]?) -> Void) {
        let urlString = "https://api.unsplash.com/search/photos?query=\(query)&client_id=\(accessKey)"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        // Perform the network request
        URLSession.shared.dataTask(with: url) { data, _, error in
            // Check for errors and valid data
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            // Decode the JSON response
            do {
                let decodedData = try JSONDecoder().decode(UnsplashResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(decodedData.results) // Return the results on the main thread
                }
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
