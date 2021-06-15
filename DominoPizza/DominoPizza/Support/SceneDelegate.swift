//
//  SceneDelegate.swift
//  DominoPizza
//
//  Created by JEON JUNHA on 2021/01/27.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        //각각의 뷰를 내비 뷰에 임베드?
        let categoryView = CategoryViewController()
        let naviViewController = UINavigationController(rootViewController: categoryView)
        let wishListView = WishListViewController()
        let naviViewController2 = UINavigationController(rootViewController: wishListView)
        let TabViewController = UITabBarController()

        let item1 = UITabBarItem(title: "Category", image: UIImage(named: "domino's"), tag: 0)
        let item2 = UITabBarItem(title: "Wish List", image: UIImage(named: "wishlist"), tag: 1)
        
        //임베드된 내비뷰 두개를 탭바컨트롤러에 임베드
        TabViewController.setViewControllers([naviViewController, naviViewController2], animated: true)
             categoryView.tabBarItem = item1
             wishListView.tabBarItem = item2

        //각각의 titile 생성
        naviViewController.navigationBar.topItem?.title = "Domino's"
        naviViewController2.navigationBar.topItem?.title = "WishList"

        window?.rootViewController = TabViewController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

