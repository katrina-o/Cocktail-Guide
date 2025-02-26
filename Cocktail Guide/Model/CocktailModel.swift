//
//  CocktailModel.swift
//  Cocktail Guide
//
//  Created by Екатерина Орлова on 24.02.2025.
//

import Foundation

struct CocktailModel : Decodable {
    var ingredients: [String]
    var instructions: String
    var name: String
}
