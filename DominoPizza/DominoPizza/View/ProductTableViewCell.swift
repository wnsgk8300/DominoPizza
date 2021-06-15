//
//  ProductTableViewCell.swift
//  DominoPizza
//
//  Created by JEON JUNHA on 2021/01/27.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    let product = UIImageView()
    let productLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: reuseIdentifier)
        setUI()
        productLabel.numberOfLines = 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setUI() {
        [product, productLabel].forEach { (view) in
            self.contentView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            product.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            product.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            product.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            product.widthAnchor.constraint(equalToConstant: 120),
            productLabel.leadingAnchor.constraint(equalTo: product.trailingAnchor, constant: 10),
            productLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            productLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            productLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor)
        ])
    }
}
