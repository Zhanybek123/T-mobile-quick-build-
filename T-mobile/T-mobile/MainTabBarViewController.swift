//
//  MainTabBarViewController.swift
//  T-mobile
//
//  Created by zhanybek salgarin on 6/21/23.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    private var navigationControllers: [UINavigationController] = []
    var upperLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let spacing: CGFloat = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.addTabbarIndicatorView(index: 0, isFirstTime: true)
        }
        delegate = self
    }
}

extension MainTabBarViewController {
    func setupTabBar() {
        let view1 = UINavigationController(rootViewController: ViewController())
        let view2 = UINavigationController(rootViewController: VC2())
        let view3 = UINavigationController(rootViewController: VC3())
        let view4 = UINavigationController(rootViewController: VC4())
        let view5 = UINavigationController(rootViewController: VC5())
        
        view1.tabBarItem = UITabBarItem(title: "HOME",
                                            image: nil, selectedImage: nil)
        
        view2.tabBarItem = UITabBarItem(title: "ACCOUNT",
                                        image: nil, selectedImage: nil)
        
        view3.tabBarItem = UITabBarItem(title: "BILL",
                                        image: nil, selectedImage: nil)
        
        view4.tabBarItem = UITabBarItem(title: "SHOP",
                                        image: nil, selectedImage: nil)
        
        view5.tabBarItem = UITabBarItem(title: "MORE",
                                        image: nil, selectedImage: nil)
        
        let tabBarAppearance = UITabBarAppearance()
        let tabBarItemAppearance = UITabBarItemAppearance()

        tabBarItemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        tabBarItemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        tabBarItemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .callout), size: 14)]

        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .black
        self.tabBar.layer.masksToBounds = true
        tabBar.layer.cornerRadius = 0
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        
        navigationControllers = [view1, view2, view3, view4, view5]
        
        viewControllers = navigationControllers
    }
    
    func addTabbarIndicatorView(index: Int, isFirstTime: Bool = false) {
        guard let tabView = tabBar.items?[index].value(forKey: "view") as? UIView else {
            return
        }
        if !isFirstTime {
            upperLineView.removeFromSuperview()
        }
            upperLineView = UIView(frame: CGRect(x: tabView.frame.minX + spacing, y: tabView.frame.minY, width: tabView.frame.size.width, height: 4))
            upperLineView.backgroundColor = UIColor.purple
            tabBar.addSubview(upperLineView)
        
       
    }
}

extension MainTabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        addTabbarIndicatorView(index: selectedIndex)
    }
}

class VC2: UIViewController  {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}

class VC3: UIViewController  {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

class VC4: UIViewController  {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
    }
}

class VC5: UIViewController  {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
}
