//
//  CocktailView.swift
//  Cocktail Guide
//
//  Created by Екатерина Орлова on 24.02.2025.
//

import UIKit

protocol CocktailViewDelegate: AnyObject {
    
}

final class CocktailView : UIView {
    
    weak var delegate: CocktailViewDelegate?
    
    private let backImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "CocktailBack")
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "find coctail for youself"
        search.searchBarStyle = .minimal
        search.backgroundColor = .purple.withAlphaComponent(0.3)
        search.searchTextField.backgroundColor = .purple
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.register(CocktailCell.self, forCellReuseIdentifier: CocktailCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupUI()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(backImage)
        backImage.addSubview(searchBar)
        backImage.addSubview(tableView)
    }
}

// MARK: - Extensions Constraints
extension CocktailView {
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            
            backImage.topAnchor.constraint(equalTo: topAnchor),
            backImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -10),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo:safeAreaLayoutGuide.bottomAnchor, constant: 20)
        ])
    }
}
