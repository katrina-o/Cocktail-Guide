//
//  CocktailManager.swift
//  Cocktail Guide
//
//  Created by Екатерина Орлова on 24.02.2025.
//

import Foundation

struct CocktailManager {
    
    private let apiKey = "YM6sTKqXUZvbwMtS5jCJhA==v7KJDg6AnKaUcH8P"
    private let baseURL = "https://api.api-ninjas.com/v1/cocktail"
    
    mutating func fetchData(completionHandler: @escaping ([CocktailModel]) -> Void) {
        guard let url = URL(string: baseURL) else { return }
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completionHandler([])
                return
            }
            do {
                let result = try JSONDecoder().decode([CocktailModel].self, from: data)
                completionHandler(result)
            } catch {
                print("Failed to decode JSON: \(error)")
                completionHandler([])
            }
        }
        task.resume()
    }
    
    func fetchData(with query: String, completionHandler: @escaping ([CocktailModel]) -> Void) {
        guard let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "\(baseURL)?name=\(encodedQuery)") else {
            completionHandler([])
            return
        }
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completionHandler([])
                return
            }
            do {
                let result = try JSONDecoder().decode([CocktailModel].self, from: data)
                completionHandler(result)
            } catch {
                print("Failed to decode JSON: \(error)")
                completionHandler([])
            }
        }
        task.resume()
    }
}
