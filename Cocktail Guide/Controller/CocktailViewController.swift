//
//  ViewController.swift
//  Cocktail Guide
//
//  Created by Екатерина Орлова on 24.02.2025.
//

import UIKit

final class CocktailViewController: UIViewController, CocktailViewDelegate {
    
    private let cocktailView = CocktailView()
    private var cocktailsManager = CocktailManager()
    private var cocktails: [CocktailModel] = []
    private var searchActive : Bool = false
    var filtered:[CocktailModel] = []
    
    override func loadView() {
        view = cocktailView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()

        cocktailsManager.fetchData { response in
            self.cocktails = response
            
            DispatchQueue.main.async {
                self.cocktailView.tableView.reloadData()
            }
        }
    }
    
    private func setDelegate() {
        cocktailView.tableView.delegate = self
        cocktailView.tableView.dataSource = self
        cocktailView.searchBar.delegate = self
    }
  
}

extension CocktailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchActive ? filtered.count : cocktails.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CocktailCell.identifier, for: indexPath) as? CocktailCell else {
            return UITableViewCell()
        }

        let cocktail = searchActive ? filtered[indexPath.row] : cocktails[indexPath.row]
        cell.config(ingredients: cocktail.ingredients, instruction: cocktail.instructions, name: cocktail.name)
        cell.backgroundColor = .lightGray.withAlphaComponent(0.5)
        cell.selectionStyle = .none
        cell.layer.cornerRadius = 20
        cell.layer.borderWidth = 0.7
        cell.layer.borderColor = UIColor.purple.cgColor
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

extension CocktailViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchActive = false
            searchBar.text = ""
            cocktails = filtered
            filtered = []
            cocktailView.tableView.reloadData()
        }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        searchBar.resignFirstResponder()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if searchText.isEmpty {
                searchActive = false
                filtered = []
                cocktails = filtered
                cocktailView.tableView.reloadData()
            } else {
                searchActive = true
                cocktailsManager.fetchData(with: searchText) { response in
                    self.filtered = response
                    
                    DispatchQueue.main.async {
                        self.cocktailView.tableView.reloadData()
                    }
                }
            }
        }
}
