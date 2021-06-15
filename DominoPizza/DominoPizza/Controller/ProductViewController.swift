//
//  ProductViewController.swift
//  DominoPizza
//
//  Created by JEON JUNHA on 2021/01/27.
//

import UIKit
class ProductViewController: UIViewController {
    let productTableView = UITableView()
    var selectedList: [String] = []
    let superSeedList = ["글램핑 바비큐", "알로하 하와이안", "우리 고구마", "콰트로 치즈 퐁듀"]
    let premiumList = ["더블크러스트 이베리코", "블랙앵거스 스테이크", "블랙타이거 슈림프", "와규 앤 비스테카", "직화 스테이크"]
    let classicList = ["베이컨체더치즈", "불고기", "슈퍼디럭스", "슈퍼슈프림", "페퍼로니", "포테이토"]
    let sideList = ["딸기 슈크림", "슈퍼곡물 치킨", "애플 크러스트 디저트", "치킨퐁듀 그라탕", "퀴노아 치킨 샐러드", "포테이토 순살치킨"]
    let drinkList = ["미닛메이드 스파클링 청포도", "스프라이트", "코카콜라 제로", "코카콜라"]
    let sauceList = ["갈릭 디핑 소스", "스위트 칠리소스", "우리 피클 L", "우리 피클 M", "핫소스"]
    let priceOfPiazza = 10000
    let priceOfSide = 7000
    let priceOfDrink = 3000
    let priceOfSauce = 500
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setSelectedList()
        setProductTableView()
    }
    func setUI() {
        view.addSubview(productTableView)
        productTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            productTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    func setSelectedList() {
        switch self.navigationItem.title {
        case "슈퍼시드":
            selectedList = superSeedList
        case "프리미엄":
            selectedList = premiumList
        case "클래식":
            selectedList = classicList
        case "사이드디시":
            selectedList = sideList
        case "음료":
            selectedList = drinkList
        case "피클소스":
            selectedList = sauceList
        default:
            fatalError()
        }
    }
    func setProductTableView() {
        productTableView.dataSource = self
        productTableView.delegate = self
        productTableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "ProductCell")
        productTableView.rowHeight = 120
    }
}

extension ProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        selectedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let productCell = productTableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductTableViewCell else {  fatalError() }
        productCell.product.image = UIImage(named: selectedList[indexPath.item])
        switch self.navigationItem.title {
        case "슈퍼시드", "프리미엄", "클래식":
            productCell.productLabel.text = "\(selectedList[indexPath.item])\n\(priceOfPiazza)원"
        case "사이드디시":
            productCell.productLabel.text = "\(selectedList[indexPath.item])\n\(priceOfSide)원"
        case "음료":
            productCell.productLabel.text = "\(selectedList[indexPath.item])\n\(priceOfDrink)원"
        case "피클소스":
            productCell.productLabel.text = "\(selectedList[indexPath.item])\n\(priceOfSauce)원"
        default:
            fatalError()
        }
        return productCell
    }
    
    
}
extension ProductViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = DetailViewController()
        nextVC.navigationItem.title = selectedList[indexPath.row]
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
