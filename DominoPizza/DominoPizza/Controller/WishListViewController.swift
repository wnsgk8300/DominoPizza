//
//  WishListViewController.swift
//  DominoPizza
//
//  Created by JEON JUNHA on 2021/01/27.
//
                           
import UIKit
class WishListViewController: UIViewController {
    let wishListTableView = UITableView()
    var selectedItem: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setWishListTableView()
        setNaviButton()
       }
    override func viewWillAppear(_ animated: Bool) {
        reSetWishList()
        wishListTableView.reloadData()
    }
    
    func setNaviButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "목록 지우기", style: .plain, target: self, action: #selector(clearButtonTapped(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "주문", style: .plain, target: self, action: #selector(orderButtonTapped(_:)))
    }
    
    @objc
    func clearButtonTapped(_ sender: UIButton) {
        self.selectedItem.forEach { (item) in
            OrderManager.shared.cart[item] = 0 }
        self.selectedItem.removeAll()
        self.wishListTableView.reloadData()
    }
    @objc
    func orderButtonTapped(_ sender: UIButton) {
        var orderMSG = ""
        var finalPrice = 0
        selectedItem.forEach { (item) in
            orderMSG += "\(item) - \(OrderManager.shared.cart[item] ?? 0)개\n"
            finalPrice += (OrderManager.shared.menuPrice[item] ?? 0) * (OrderManager.shared.cart[item] ?? 0)
        }
        let priceAlert = UIAlertController(title: "결제내역", message: "\(orderMSG)\(finalPrice)원", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "결제하기", style: .default) { (okAction) in
            self.selectedItem.forEach { (item) in
                OrderManager.shared.cart[item] = 0 }
            self.selectedItem.removeAll()
            self.wishListTableView.reloadData()
        }
        let cancleAction = UIAlertAction(title: "취소", style: .cancel)
        priceAlert.addAction(okAction)
        priceAlert.addAction(cancleAction)
        present(priceAlert, animated: true, completion: nil)
    }

    func setUI() {
        view.addSubview(wishListTableView)
        wishListTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wishListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            wishListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            wishListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            wishListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setWishListTableView() {
        wishListTableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "WishListCell")
        wishListTableView.rowHeight = 120
        wishListTableView.dataSource = self
    }
    
    func reSetWishList() {
        selectedItem.removeAll()
        OrderManager.shared.menu.forEach { (item) in
            if OrderManager.shared.cart[item] != 0 {
                selectedItem.append(item)
            }
        }
    }
}

extension WishListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let wishListCell = wishListTableView.dequeueReusableCell(withIdentifier: "WishListCell", for: indexPath) as? ProductTableViewCell else {  fatalError() }
        wishListCell.product.image = UIImage(named: selectedItem[indexPath.row])
        wishListCell.productLabel.text = "\(selectedItem[indexPath.row])\n\(OrderManager.shared.cart[selectedItem[indexPath.row]] ?? 0)개"
        return wishListCell
    }
    

}
