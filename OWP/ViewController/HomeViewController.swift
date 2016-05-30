//
//  HomeViewController.swift
//  OWP
//
//  Created by Andrey Klushenko on 03/05/16.
//  Copyright © 2016 Andrey Klushenko. All rights reserved.
//

import Foundation
import UIKit
import RDVTabBarController

class HomeViewController : RDVTabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

extension HomeViewController : RDVTabBarControllerDelegate{
    func tabBarController(tabBarController: RDVTabBarController!, didSelectViewController viewController: UIViewController!) {
        print("did Selected View Controller")
        
        if (viewController as? UINavigationController)?.viewControllers.first is PrivateMessageViewController {
            print("Private Message View Controller")
        }
        
    }
    
    func tabBarController(tabBarController: RDVTabBarController!, shouldSelectViewController viewController: UIViewController!) -> Bool {
        return true
    }
    
    override func tabBar(tabBar: RDVTabBar!, didSelectItemAtIndex index: Int){
        super.tabBar(tabBar, didSelectItemAtIndex: index)
        print (index)
    }
    
    override func tabBar(tabBar: RDVTabBar!, shouldSelectItemAtIndex index: Int) -> Bool {
        return super.tabBar(tabBar, shouldSelectItemAtIndex: index)
    }
    
    
}
