//
//  NetworkManager.swift
//  newsApplication
//
//  Created by Zharkyngali Savanbay on 05.02.2021.
//  Copyright © 2021 Zharkyngali Savanbay. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
     
    @Published var posts = [Properties]()
    
    func fetchData() {
        if let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=494799f7f38b47cd8a421329c2cb9925") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do{
                            let results = try decoder.decode(NetworkData.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.articles
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
}
