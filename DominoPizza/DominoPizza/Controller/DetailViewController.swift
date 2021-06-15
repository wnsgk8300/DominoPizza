//
//  DetailViewController.swift
//  DominoPizza
//
//  Created by JEON JUNHA on 2021/01/27.
//

import UIKit
class DetailViewController: UIViewController {
    let orderImageView = UIImageView()
    var itemName = ""
    let stackView = UIStackView()
    let minusButton = UIButton(type: .system)
    let plusButton = UIButton(type: .system)
    let numLabel = UILabel()
    var num = 0
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setImageView()
        setStackView()
        stackView.backgroundColor = .gray
        setButton()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        numLabel.text = "\(OrderManager.shared.cart[itemName]!)개"
    }
    
    // MARK: - setUI
    func setUI() {
        [orderImageView, stackView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            orderImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            orderImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            orderImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            orderImageView.heightAnchor.constraint(equalTo: view.widthAnchor),
            
            stackView.topAnchor.constraint(equalTo: orderImageView.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            stackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setImageView() {
        itemName = self.navigationItem.title!
        orderImageView.image = UIImage(named: itemName)
    }
    func setStackView() {
        numLabel.text = "0개"
        numLabel.textAlignment = .center
        numLabel.textColor = .white
        plusButton.setTitle("+", for: .normal)
        minusButton.setTitle("-", for: .normal)
        [minusButton, plusButton].forEach {
            $0.backgroundColor = .white
            $0.setTitleColor(.black, for: .normal)
            $0.layer.borderWidth = 3
            $0.layer.borderColor = UIColor.gray.cgColor
        }
        [minusButton, numLabel, plusButton].forEach {
            stackView.addArrangedSubview($0)
        }
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
    }
    func setButton() {
        minusButton.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
    }
    @objc
    func handleButton(_ sender: UIButton) {
        
        switch sender {
        case plusButton:
            OrderManager.shared.cart[itemName]! += 1
        case minusButton:
            if OrderManager.shared.cart[itemName] ?? 0 >= 1 {
                OrderManager.shared.cart[itemName]! -= 1
            } else {
                OrderManager.shared.cart[itemName] = 0
            }
        default:
            fatalError()
        }
        num = OrderManager.shared.cart[itemName]!
        numLabel.text = "\(num)개"
    }
}


