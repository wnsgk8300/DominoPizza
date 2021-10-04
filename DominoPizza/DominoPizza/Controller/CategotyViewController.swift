//
//  CategotyViewController.swift
//  DominoPizza
//
//  Created by JEON JUNHA on 2021/01/27.
//

import UIKit

class CategoryViewController: UIViewController {

    let categoryList = ["슈퍼시드", "프리미엄", "클래식", "사이드디시", "음료", "피클소스"]
    let categoryTableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setCategotyTableView()
        setUI()
        
    }
    func setCategotyTableView() {
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
        categoryTableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "CategoryCell")
        categoryTableView.rowHeight = 100
    }
    func setUI() {
        view.addSubview(categoryTableView)
        let CategoryHeaderView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 200))
        categoryTableView.tableHeaderView = CategoryHeaderView
        CategoryHeaderView.image = UIImage(named: "logo")
        categoryTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            categoryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let categoryCell = categoryTableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoryTableViewCell else {  fatalError() }
        categoryCell.category.image = UIImage(named: categoryList[indexPath.item])
        return categoryCell
    }
    
    
}
extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = ProductViewController()
        nextVC.navigationItem.title = categoryList[indexPath.row]
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
