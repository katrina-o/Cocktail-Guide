//
//  CocktailCell.swift
//  Cocktail Guide
//
//  Created by Екатерина Орлова on 24.02.2025.
//

import UIKit

class CocktailCell: UITableViewCell {
    
   static let identifier = CocktailCell.description()
    
    private  var cocktailName = UILabel.createLabel(text: "", fontSize: 30, isBold: true, textAlignment: .center, numberOfLines: 1)
    private var cocktailIngrediens = UILabel.createLabel(text: "", fontSize: 20, isBold: false, textAlignment: .center, numberOfLines: 0)
    private  var cocktailInsruction = UILabel.createLabel(text: "", fontSize: 20)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func config(ingredients: [String], instruction: String, name: String) {
        cocktailIngrediens.text = ingredients.joined(separator: ", ")
        cocktailInsruction.text = instruction
        cocktailName.text = name
    }
    private func setupUI() {
        [cocktailName,
         cocktailIngrediens,
         cocktailInsruction].forEach { addSubview($0) }
        
        NSLayoutConstraint.activate([
            cocktailName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cocktailName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cocktailName.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            
            cocktailIngrediens.topAnchor.constraint(equalTo: cocktailName.bottomAnchor, constant: 20),
            cocktailIngrediens.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cocktailIngrediens.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            cocktailInsruction.topAnchor.constraint(equalTo: cocktailIngrediens.bottomAnchor, constant: 20),
            cocktailInsruction.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cocktailInsruction.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
}
