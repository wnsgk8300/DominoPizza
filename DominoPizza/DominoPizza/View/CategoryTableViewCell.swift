//
//  CategoryTableViewCell.swift
//  DominoPizza
//
//  Created by JEON JUNHA on 2021/01/27.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    let category = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setUI() {
            self.contentView.addSubview(category)
            category.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            category.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            category.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            category.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            category.widthAnchor.constraint(equalTo: self.contentView.widthAnchor)
        ])
    }
}
