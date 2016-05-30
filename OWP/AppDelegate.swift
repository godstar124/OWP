//
//  AppDelegate.swift
//  OWP
//
//  Created by Andrey Klushenko on 01/05/16.
//  Copyright © 2016 Andrey Klushenko. All rights reserved.
//

import UIKit
import RDVTabBarController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        UIApplication.sharedApplication().statusBarHidden = true
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func showHomeViewController(){
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let feedNavigationVC = storyboard.instantiateViewControllerWithIdentifier("FeedNavigationVC") as? UINavigationController
        
        let subscribeNavigationVC = storyboard.instantiateViewControllerWithIdentifier("SubscribeNavigationVC") as? UINavigationController
        
        let profileNavigationVC = storyboard.instantiateViewControllerWithIdentifier("ProfileNavigationVC") as? UINavigationController
        
        let notificationNavigationVC = storyboard.instantiateViewControllerWithIdentifier("NotificationNavigationVC") as? UINavigationController
        
        let privateMessageNavigationVC = storyboard.instantiateViewControllerWithIdentifier("PrivateMessageNavigationVC") as? UINavigationController
        
        let tabBarController = HomeViewController()
        
        tabBarController.viewControllers = [feedNavigationVC!,
                                            subscribeNavigationVC!,
                                            profileNavigationVC!,
                                            notificationNavigationVC!,
                                            privateMessageNavigationVC!]
        tabBarController.delegate = tabBarController
        
        let tabBar = tabBarController.tabBar
        
        tabBar.frame = CGRectMake(CGRectGetMinX(tabBar.frame), CGRectGetMinY(tabBar.frame),
                                  CGRectGetWidth(tabBar.frame), 63.0)
        tabBar.setHeight(63.0)
        
        let finishedImage = UIImage(named: "tabbar_selected_background")
        let unfinishedImage = UIImage(named: "tabbar_normal_background")
        
        let tabBarItemImages = ["tab_img_feed_iphone6", "tab_img_scribe_iphone6", "tab_img_profile_iphone6", "tab_img_notification_iphone6", "tab_img_privatemessage_iphone6"]
        
        let tabBarItemSelectedImages = ["tab_img_feed_selected_iphone6", "tab_img_scribe_selected_iphone6", "tab_img_profile_selected_iphone6", "tab_img_notification_selected_iphone6", "tab_img_privatemessage_selected_iphone6"]
        
        var index = 0
        for item in tabBarController.tabBar.items{
            item.setBackgroundSelectedImage(finishedImage, withUnselectedImage: unfinishedImage)
            
            let selectedImage = UIImage(named: tabBarItemSelectedImages[index])
            let unselectedImage = UIImage(named: tabBarItemImages[index])
            
            item.setFinishedSelectedImage(selectedImage, withFinishedUnselectedImage: unselectedImage)
            
            index += 1
        }
        
        self.window?.rootViewController = tabBarController
    }
    


}

