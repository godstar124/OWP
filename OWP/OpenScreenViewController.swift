//
//  OpenScreenViewController.swift
//  OWP
//
//  Created by Andrey Klushenko on 01/05/16.
//  Copyright © 2016 Andrey Klushenko. All rights reserved.
//

import Foundation
import UIKit

class OpenScreenViewController : UIViewController{
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(animated: Bool) {
        //UIApplication.sharedApplication().statusBarStyle = .LightContent
        UIApplication.sharedApplication().statusBarHidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func onLogin(){
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("vcLoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onSignup(){
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("vcSignupViewController") as! SignupViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
