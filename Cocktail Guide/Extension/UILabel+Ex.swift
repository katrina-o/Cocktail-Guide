//
//  Extensions.swift
//  Cocktail Guide
//
//  Created by Екатерина Орлова on 24.02.2025.
//


import UIKit

extension UILabel {
    static func createLabel(text: String,
                            fontSize: CGFloat,
                            isBold: Bool = false,
                            textAlignment: NSTextAlignment = .center,
                            numberOfLines: Int = 0) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .systemPink
        label.font = isBold ? UIFont.boldSystemFont(ofSize: fontSize) : UIFont.systemFont(ofSize: fontSize)
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
